library(spatstat)


### Name: affine.psp
### Title: Apply Affine Transformation To Line Segment Pattern
### Aliases: affine.psp
### Keywords: spatial math

### ** Examples

  oldpar <- par(mfrow=c(2,1))
  X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  plot(X, main="original")
  # shear transformation
  Y <- affine(X, matrix(c(1,0,0.6,1),ncol=2))
  plot(Y, main="transformed")
  par(oldpar)
  # 
  # rescale y coordinates by factor 0.2
  affine(X, diag(c(1,0.2)))



