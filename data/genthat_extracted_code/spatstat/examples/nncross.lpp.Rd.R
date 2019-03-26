library(spatstat)


### Name: nncross.lpp
### Title: Nearest Neighbours on a Linear Network
### Aliases: nncross.lpp
### Keywords: spatial math

### ** Examples

  # two different point patterns
  X <- runiflpp(3, simplenet)
  Y <- runiflpp(5, simplenet)
  nn <- nncross(X,Y)
  nn
  plot(simplenet, main="nncross")
  plot(X, add=TRUE, cols="red")
  plot(Y, add=TRUE, cols="blue", pch=16)
  XX <- as.ppp(X)
  YY <- as.ppp(Y)
  i <- nn$which
  arrows(XX$x, XX$y, YY[i]$x, YY[i]$y, length=0.15)

  # nearest and second-nearest neighbours
  nncross(X, Y, k=1:2)

  # two patterns with some points in common
  X <- Y[1:2]
  iX <- 1:2
  iY <- 1:5
  nncross(X,Y, iX, iY)



