library(RConics)


### Name: ellipseToConicMatrix
### Title: Transformation of the ellipse parameters into the matrix
###   representation
### Aliases: ellipseToConicMatrix

### ** Examples

  # Ellipse parameters
  saxes <- c(5,2)
  loc <- c(0,0)
  theta <- pi/4
  # Matrix representation of the ellipse
  C <- ellipseToConicMatrix(saxes,loc,theta)



