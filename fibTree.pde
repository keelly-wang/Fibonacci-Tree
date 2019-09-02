void setup(){
  size(800,800);
  background(0);
  PVector origin = new PVector(400,800);
  fibTree(25,origin,150,PI/2,PI/6,0);
}

void fibTree(int n, PVector p, float L, float theta, float dtheta, int age){
  PVector p2 = new PVector(p.x+cos(theta)*L, p.y-sin(theta)*L);
  drawBranch(p,p2,age);
  
  if (n > 1){
    if (age == 0){
      fibTree(n-1, p2, L*0.8, theta, dtheta, 1);
    } else {
      fibTree(n-1, p2, L*0.8, theta-dtheta, dtheta, 2);
      fibTree(n-1, p2, L*0.8, theta+dtheta, dtheta, 0);
    }
  }
  
}

void drawBranch(PVector p, PVector p2, int age){
  if (age == 0) stroke(255,0,0);
  else if (age == 1) stroke(0,255,0);
  else stroke(0,0,255);
  line(p.x,p.y,p2.x,p2.y);
}
