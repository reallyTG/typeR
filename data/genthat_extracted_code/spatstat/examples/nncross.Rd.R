library(spatstat)


### Name: nncross
### Title: Nearest Neighbours Between Two Patterns
### Aliases: nncross nncross.ppp nncross.default
### Keywords: spatial math

### ** Examples

  # two different point patterns
  X <- runifpoint(15)
  Y <- runifpoint(20)
  N <- nncross(X,Y)$which
  # note that length(N) = 15
  plot(superimpose(X=X,Y=Y), main="nncross", cols=c("red","blue"))
  arrows(X$x, X$y, Y[N]$x, Y[N]$y, length=0.15)

  # third-nearest neighbour
  NXY <- nncross(X, Y, k=3)
  NXY[1:3,]
  # second and third nearest neighbours
  NXY <- nncross(X, Y, k=2:3)
  NXY[1:3,]

  # two patterns with some points in common
  Z <- runifpoint(50)
  X <- Z[1:30]
  Y <- Z[20:50]
  iX <- 1:30
  iY <- 20:50
  N <- nncross(X,Y, iX, iY)$which
  N <- nncross(X,Y, iX, iY, what="which") #faster
  plot(superimpose(X=X, Y=Y), main="nncross", cols=c("red","blue"))
  arrows(X$x, X$y, Y[N]$x, Y[N]$y, length=0.15)

  # point pattern and line segment pattern
  X <- runifpoint(15)
  Y <- rpoisline(10)
  N <- nncross(X,Y)



