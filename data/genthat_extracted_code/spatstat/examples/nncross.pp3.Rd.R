library(spatstat)


### Name: nncross.pp3
### Title: Nearest Neighbours Between Two Patterns in 3D
### Aliases: nncross.pp3
### Keywords: spatial math

### ** Examples

  # two different point patterns
  X <- pp3(runif(10), runif(10), runif(10), box3(c(0,1)))
  Y <- pp3(runif(20), runif(20), runif(20), box3(c(0,1)))
  N <- nncross(X,Y)$which
  N <- nncross(X,Y, what="which") #faster
  # note that length(N) = 10

  # k-nearest neighbours
  N3 <- nncross(X, Y, k=1:3)

  # two patterns with some points in common
  Z <- pp3(runif(20), runif(20), runif(20), box3(c(0,1)))
  X <- Z[1:15]
  Y <- Z[10:20]
  iX <- 1:15
  iY <- 10:20
  N <- nncross(X,Y, iX, iY, what="which")




