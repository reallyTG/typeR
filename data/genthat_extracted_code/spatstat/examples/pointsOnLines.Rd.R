library(spatstat)


### Name: pointsOnLines
### Title: Place Points Evenly Along Specified Lines
### Aliases: pointsOnLines
### Keywords: spatial manip

### ** Examples

  X <- psp(runif(20), runif(20), runif(20), runif(20),  window=owin())
  Y <- pointsOnLines(X, eps=0.05)
  plot(X, main="")
  plot(Y, add=TRUE, pch="+")



