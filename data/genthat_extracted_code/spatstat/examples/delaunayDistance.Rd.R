library(spatstat)


### Name: delaunayDistance
### Title: Distance on Delaunay Triangulation
### Aliases: delaunayDistance
### Keywords: spatial manip

### ** Examples

  X <- runifpoint(20)
  M <- delaunayDistance(X)
  plot(delaunay(X), lty=3)
  text(X, labels=M[1, ], cex=2)



