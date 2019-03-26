library(spatstat)


### Name: affine.im
### Title: Apply Affine Transformation To Pixel Image
### Aliases: affine.im
### Keywords: spatial math

### ** Examples

  X <- setcov(owin())
  stretch <- diag(c(2,3))
  Y <- affine(X, mat=stretch)
  shear <- matrix(c(1,0,0.6,1),ncol=2, nrow=2)
  Z <- affine(X, mat=shear)



