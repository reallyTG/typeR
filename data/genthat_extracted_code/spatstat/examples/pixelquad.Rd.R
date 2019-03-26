library(spatstat)


### Name: pixelquad
### Title: Quadrature Scheme Based on Pixel Grid
### Aliases: pixelquad
### Keywords: spatial datagen

### ** Examples

  W <- owin(c(0,1),c(0,1))
  X <- runifpoint(42, W)
  W <- as.mask(W,dimyx=128)
  pixelquad(X,W)



