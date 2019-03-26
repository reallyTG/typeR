library(RConics)


### Name: conicMatrixToEllipse
### Title: Transformation of the matrix representation of an ellipse into
###   the ellipse parameters
### Aliases: conicMatrixToEllipse

### ** Examples

# ellipse parameter
saxes <- c(5,2)
loc <- c(0,0)
theta <- pi/4
# matrix representation of the ellipse
C <- ellipseToConicMatrix(saxes,loc,theta)
C
# back to the ellipse parameters
conicMatrixToEllipse(C)



