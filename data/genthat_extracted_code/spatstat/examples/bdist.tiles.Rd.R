library(spatstat)


### Name: bdist.tiles
### Title: Distance to Boundary of Window
### Aliases: bdist.tiles
### Keywords: spatial math

### ** Examples

  P <- runifpoint(15)
  X <- dirichlet(P)
  plot(X, col="red")
  B <- bdist.tiles(X)
  # identify tiles that do not touch the boundary
  plot(X[B > 0], add=TRUE, col="green", lwd=3)



