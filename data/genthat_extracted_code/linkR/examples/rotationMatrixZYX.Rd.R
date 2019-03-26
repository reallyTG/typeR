library(linkR)


### Name: rotationMatrixZYX
### Title: Returns a matrix to rotate points along the z-, y- and x-axes
### Aliases: rotationMatrixZYX
### Keywords: rotation matrix

### ** Examples

## SPECIFY 3D POINT SET
m <- matrix(c(0,0,0, 1,2,1, 3,0,3, -2,4,1), nrow=4, ncol=3, byrow=TRUE)

## ROTATE 180 DEGREES ABOUT THE Z AXIS
## X AND Y VALUES ARE OPPOSITE AND Z VALUES UNCHANGED
m %*% rotationMatrixZYX(pi, 0, 0)

## ROTATE 180 DEGREES ABOUT THE X AXIS
## Y AND Z VALUES ARE OPPOSITE AND X VALUES UNCHANGED
m %*% rotationMatrixZYX(0, 0, pi)

## ROTATE 90 DEGREES ABOUT THE Z-, THEN Y-, THEN X-AXIS
m %*% rotationMatrixZYX(pi/2, pi/2, pi/2)

## ROTATE 90 DEGREES ABOUT THE Z-, THEN Y-, THEN X-AXIS
m %*% rotationMatrixZYX(c(pi/2, pi/2, pi/2))



