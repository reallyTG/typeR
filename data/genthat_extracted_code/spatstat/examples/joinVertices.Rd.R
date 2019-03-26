library(spatstat)


### Name: joinVertices
### Title: Join Vertices in a Network
### Aliases: joinVertices
### Keywords: spatial manip

### ** Examples

  snet <- joinVertices(simplenet, 4, 8)
  plot(solist(simplenet, snet), main="")
  X <- runiflpp(3, simplenet)
  Y <- joinVertices(X, 4, 8)



