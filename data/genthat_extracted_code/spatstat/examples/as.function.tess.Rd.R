library(spatstat)


### Name: as.function.tess
### Title: Convert a Tessellation to a Function
### Aliases: as.function.tess
### Keywords: spatial manip

### ** Examples

  X <- runifpoint(7)
  V <- dirichlet(X)
  f <- as.function(V)
  f(0.1, 0.4)
  plot(f)



