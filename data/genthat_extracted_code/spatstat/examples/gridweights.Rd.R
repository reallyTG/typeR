library(spatstat)


### Name: gridweights
### Title: Compute Quadrature Weights Based on Grid Counts
### Aliases: gridweights
### Keywords: spatial datagen

### ** Examples

  Q <- quadscheme(runifpoispp(10))
  X <- as.ppp(Q) # data and dummy points together
  w <- gridweights(X, 10)
  w <- gridweights(X, c(10, 10))



