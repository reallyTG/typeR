library(RConics)


### Name: Intersection with conics
### Title: Intersections with conics
### Aliases: intersectConicLine intersectConicConic

### ** Examples

  # Ellipse with semi-axes a=8, b=2, centered in (0,0), with orientation angle = -pi/3
  C <- ellipseToConicMatrix(c(8,2),c(0,0),-pi/3)
  
  # Ellipse with semi-axes a=5, b=2, centered in (1,-2), with orientation angle = pi/5
  C2 <- ellipseToConicMatrix(c(5,2),c(1,-2),pi/5)
  
  
  # line
  l <- c(0.25,0.85,-3)
  
  # intersection conic C with line l:
  p_Cl <- intersectConicLine(C,l)
  
  # intersection conic C with conic C2
  p_CC2 <- intersectConicConic(C,C2)
  
  # plot
  plot(ellipse(c(8,2),c(0,0),-pi/3),type="l",asp=1)
  lines(ellipse(c(5,2),c(1,-2),pi/5), col="blue")
  addLine(l,col="red")
  points(t(p_Cl), pch=20,col="red")
  points(t(p_CC2), pch=20,col="blue")
  



