library(spatstat)


### Name: affine.lpp
### Title: Apply Geometrical Transformations to Point Pattern on a Linear
###   Network
### Aliases: affine.lpp shift.lpp rotate.lpp rescale.lpp scalardilate.lpp
### Keywords: spatial math

### ** Examples

  X <- rpoislpp(2, simplenet)
  U <- rotate(X, pi)
  V <- shift(X, c(0.1, 0.2))
  stretch <- diag(c(2,3))
  Y <- affine(X, mat=stretch)
  shear <- matrix(c(1,0,0.6,1),ncol=2, nrow=2)
  Z <- affine(X, mat=shear, vec=c(0, 1))



