library(spatstat)


### Name: compileK
### Title: Generic Calculation of K Function and Pair Correlation Function
### Aliases: compileK compilepcf
### Keywords: spatial nonparametric

### ** Examples

  X <- japanesepines
  D <- pairdist(X)
  Wt <- edge.Ripley(X, D)
  lambda <- intensity(X)
  a <- (npoints(X)-1) * lambda
  r <- seq(0, 0.25, by=0.01)
  K <- compileK(D=D, r=r, weights=Wt, denom=a)
  g <- compilepcf(D=D, r=r, weights=Wt, denom= a * 2 * pi * r)



