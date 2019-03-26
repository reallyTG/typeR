library(spatstat)


### Name: nearestsegment
### Title: Find Line Segment Nearest to Each Point
### Aliases: nearestsegment
### Keywords: spatial math

### ** Examples

  X <- runifpoint(3)
  Y <- as.psp(matrix(runif(20), 5, 4), window=owin())
  v <- nearestsegment(X,Y)
  plot(Y)
  plot(X, add=TRUE)
  plot(X[1], add=TRUE, col="red")
  plot(Y[v[1]], add=TRUE, lwd=2, col="red") 



