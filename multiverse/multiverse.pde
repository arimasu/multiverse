void setup() {
  size(500,500); 
  background(0);
  noFill();
  stroke(255);

  float x = 250.0; 
  float y = 250.0;
  float initialDiameter = 400.0;
  int numberOfInnerMultiverses = 14;
  float multiverseSpreadFromCentreFactor = 0.72;
  float multiverseSizeFactor = 0.253;
  float innerMultiverseSizeFactor = 0.52;

  
  drawMultiverse(x,y,initialDiameter, numberOfInnerMultiverses, multiverseSpreadFromCentreFactor, multiverseSizeFactor, innerMultiverseSizeFactor);

}

void draw () {
  // do nothing.
}

void drawMultiverse(float x, float y, float diameter, int numberOfInnerMultiverses, float multiverseSpreadFromCentreFactor,float  multiverseSizeFactor, float innerMultiverseSizeFactor) {

  ellipse(x,y,diameter,diameter);

  if (diameter * multiverseSizeFactor > 4.0) { // if next multiverse will have a diameter smaller than a threshhold, don't do the processing required to set it up, and don't draw it.

    // call this function within itself! recursion.
    drawMultiverse(x,y,diameter*innerMultiverseSizeFactor,numberOfInnerMultiverses, multiverseSpreadFromCentreFactor, multiverseSizeFactor, innerMultiverseSizeFactor);

    for(float i = 0; i < numberOfInnerMultiverses; i ++ ) {

      float xi = x + (float)(Math.sin( (i / numberOfInnerMultiverses) * 2.0 * Math.PI) * diameter * (multiverseSpreadFromCentreFactor/2.0));
      float yi = y + (float)(Math.cos( (i / numberOfInnerMultiverses) * 2.0 * Math.PI) * diameter * (multiverseSpreadFromCentreFactor/2.0));
      
      // call this function within itself! recursion.
      drawMultiverse(xi,yi,diameter*multiverseSizeFactor,numberOfInnerMultiverses, multiverseSpreadFromCentreFactor, multiverseSizeFactor, innerMultiverseSizeFactor);
    }
  }
}