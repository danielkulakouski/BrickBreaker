PFont myFont;
int row = 6;
int [] columns = new int [8];
int [] rows = new int [row];
int rowsX;
int columnsX;
boolean[] keys;
float playerX = 400;
float playerY = 470;
float ballX = 400;
float ballY = 350;
boolean start = false;
float speedX = random(-5, 5);
float speedY = random(3, 5);
int level = 1;
int[] brickX = new int [10];
int[] brickY = new int [3];
int posBrickX = 10;
int posBrickY = 20;
Boolean [] redbrick = new Boolean [8];
Boolean [] orangebrick = new Boolean [8];
Boolean [] yellowbrick = new Boolean [8];
Boolean [] greenbrick = new Boolean [8];
Boolean [] bluebrick = new Boolean [8];
Boolean [] purplebrick = new Boolean [8];

void setLevelVariables (int level) {
  if (level == 1) {
    for (int i=0; i<8; i++) {
      redbrick[i] = true;
      orangebrick[i] = false;
      yellowbrick[i] = false;
      greenbrick[i] = false;
      bluebrick[i] = false;
      purplebrick[i] = false;
    }
  }
  if (level == 2) {
    for (int i=0; i<8; i++) {
      start=false;
      redbrick[i] = true;
      orangebrick[i] = true;
      yellowbrick[i] = false;
      greenbrick[i] = false;
      bluebrick[i] = false;
      purplebrick[i] = false;
    }
  }
  if (level == 3) {
    for (int i=0; i<8; i++) {
      start=false;
      redbrick[i] = true;
      orangebrick[i] = true;
      yellowbrick[i] = true;
      greenbrick[i] = false;
      bluebrick[i] = false;
      purplebrick[i] = false;
    }
  }
  if (level == 4) {
    for (int i=0; i<8; i++) {
      start=false;
      redbrick[i] = true;
      orangebrick[i] = true;
      yellowbrick[i] = true;
      greenbrick[i] = true;
      bluebrick[i] = false;
      purplebrick[i] = false;
    }
  }
  if (level == 5) {
    for (int i=0; i<8; i++) {
      start=false;
      redbrick[i] = true;
      orangebrick[i] = true;
      yellowbrick[i] = true;
      greenbrick[i] = true;
      bluebrick[i] = true;
      purplebrick[i] = false;
    }
  }
  if (level == 6) {
    for (int i=0; i<8; i++) {
      start=false;
      redbrick[i] = true;
      orangebrick[i] = true;
      yellowbrick[i] = true;
      greenbrick[i] = true;
      bluebrick[i] = true;
      purplebrick[i] = true;
    }
  }
} 

void setup() {
  size(800, 500);
  background(0);
  setLevelVariables (level);
  myFont = loadFont("HoboStd-48.vlw");
  textFont(myFont);

  for (int i=0; i<10; i++) {
    brickX[i] = posBrickX;
    posBrickX = posBrickX + 105;
  }

  for (int i=0; i<3; i++) { 
    brickY [i] = posBrickY;
    posBrickY = posBrickY + 30;
  }

  keys=new boolean[2];
  keys[0]=false;
  keys[1]=false;
}

void draw() {
  rectMode(CORNER);
  background(0);
  for (int i=0; i<8; i++) {         
    if (redbrick[i] == true) {
      fill(255, 0, 0);
      rect (brickX[i], brickY[0], 100, 30);
    }
    if (orangebrick [i] == true) {      // brick is drawn if not broken and if it is visible in this level
      rect (brickX[i], brickY[1], 100, 30);
    }
    if (yellowbrick [i] == true) {     // brick is drawn if not broken and if it is visible in this level
      rect (brickX[i], brickY[2], 100, 30);
    }

    if (redbrick[7]==false) {
      level = 2;
    }
  }
  rectMode(CENTER);
  fill(0, 255, 0);
  rect(playerX, playerY, 170, 20);
  fill(random(255), random(255), random(255));
  ellipse(ballX, ballY, 24, 24);
  player();
  moveBall();
  bounceBall();
}

void player() {
  if ( keys[0]) {
    playerX-=10;
  }
  if ( keys[1]) {
    playerX+=10;
  }
  if (playerX<=-80) {
    playerX = 710;
  }
  if (playerX>=885) {
    playerX = 80;
  }
}

void moveBall() {
  if (start==true) {
    ballX+=-speedX;
    ballY+=-speedY;
  }
}

void bounceBall() {
  if ((ballY+12>=playerY-10) && (ballX-12>=playerX-85 && ballX+12<=playerX+85)) {
    speedY = -speedY;
  }
  if (ballX-12<=0) {
    speedX = -speedX;
  }
  if (ballX+12>=width) {
    speedX = -speedX;
  }
  if (ballY-12<=0) {
    speedY = -speedY;
  }
  if (ballY+12>=height) {
    castNewBall();
  }

  for (int i=0; i < 8; i++) {     // check for coollisions between the ball and the briks in this level (only geern ones are visible)     
    if (redbrick [i] == true && ballY-12 <= brickY[0]+15 && ballX-12 >= brickX[i] && ballX+12 <= brickX[i] + 100) {
      redbrick [i] = false;
      speedY = -speedY;
    }
  }
  for (int i=0; i < 8; i++) {     // check for coollisions between the ball and the briks in this level (only geern ones are visible)     
    if (orangebrick [i] == true && ballY-12 <= brickY[1]+15 && ballX-12 >= brickX[i] && ballX+12 <= brickX[i] + 100) {
      orangebrick [i] = false;
      speedY = -speedY;
    }
  }
  for (int i=0; i < 8; i++) {     // check for coollisions between the ball and the briks in this level (only geern ones are visible)     
    if (yellowbrick [i] == true && ballY-12 <= brickY[2]+15 && ballX-12 >= brickX[i] && ballX+12 <= brickX[i] + 100) {
      yellowbrick [i] = false;
      speedY = -speedY;
    }
  }
}

void castNewBall() {
  start = false;
  speedY = abs(speedY);
  ballX = 400;
  ballY = 350;
}

void keyPressed() {
  if (keyCode==LEFT)  keys[0]=true;
  if (keyCode==RIGHT)  keys[1]=true;
  if (key==' ') start=true;

  if (keyCode==ENTER) { //determines if spacebar is pressed
    if (looping) {
      textAlign(CENTER);
      textSize(50);
      fill(255);
      text("Paused \n Press Space To Continue", width/2, height/2);
      noLoop();
    } else {
      loop();
    }
  }
}

void keyReleased() {
  if (keyCode==LEFT) keys[0]=false;
  if (keyCode==RIGHT) keys[1]=false;
}