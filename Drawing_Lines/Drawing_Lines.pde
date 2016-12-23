// Drawing Lines
// by Wei Wei Chi (Oct 3th 2016) 

// Increase Speed when pressing UP
// Decrease Speed when pressing DOWN
// Change Direction when pressing LEFT or RIGHT
// Save current frame when pressing 's' or 'S'

int numBalls = 15; // no. of balls
boolean run = true;

BouncingBall[] balls = new BouncingBall[numBalls]; // Setting up # Arrays 

void setup() {
  size(1440, 900);
  background(0);
  for (int i = 0; i < numBalls; i++) { // Limiting the no. Bouncing Balls to # Arrays
    float d = 2; // size of balls
    float x = random(width - d); // randomizing x position of each circle in the frame
    float y = random(height - d); // randomizing y position of each circle in the frame
    balls[i] = new BouncingBall(x, y, d, i, balls); // Assigning (x, y, d) variables to BouncingBall
  }
}

void draw() {
  //background(0, 255);
  for (int i = 0; i < balls.length; i++) {
    //for (BouncingBall balls : balls) {
    balls[i].display(); // displaying balls
    balls[i].move(); // movement of balls
    if (run) { 
      balls[i].connect(); // drawing connected lines
    }
  }
}


void mousePressed() {
  run = !run; // Stop and Start when mouse is Pressed
}

void keyPressed() {

  if (key == CODED) {
    for (int i = 0; i < balls.length; i++) {
      BouncingBall b = balls[i]; // Drawing Variables from BouncingBall Class
      if (keyCode == UP) { // Increase Speed when pressing UP
        b.xspeed = b.xspeed * 1.1;
        b.yspeed = b.yspeed * 1.1;
      }    
      if (keyCode == DOWN) { // Decrease Speed when pressing DOWN
        b.xspeed = b.xspeed * 0.9;
        b.yspeed = b.yspeed * 0.9;
      }
      if (keyCode == LEFT) { // Change Direction when pressing LEFT
        b.xdirection = b.xdirection * -1;
        b.ydirection = b.ydirection * -1;
      }   
      if (keyCode == RIGHT) { // Change Direction when pressing RIGHT
        b.xdirection = b.xdirection * -1;
        b.ydirection = b.ydirection * -1;
      }
    }
  } else if (key == 's' || key == 'S') { // Save current frame when pressing 's' or 'S'
    saveFrame("connectinglines-######.png");
  }
}