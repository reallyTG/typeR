library(ThreeWay)


### Name: orthmax2
### Title: Orthomax Rotation
### Aliases: orthmax2
### Keywords: array multivariate algebra

### ** Examples

X <- matrix(rnorm(8*3),ncol=3)
Y <- matrix(rnorm(6*3),ncol=3)
orthXY <- orthmax2(X,Y,1,2)
# rotated version of X
orthXY$B1
# rotated version of Y
orthXY$B2
# rotation matrix
orthXY$T



