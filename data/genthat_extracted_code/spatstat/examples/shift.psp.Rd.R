library(spatstat)


### Name: shift.psp
### Title: Apply Vector Translation To Line Segment Pattern
### Aliases: shift.psp
### Keywords: spatial manip

### ** Examples

  X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  plot(X, col="red")
  Y <- shift(X, c(0.05,0.05))
  plot(Y, add=TRUE, col="blue")

  shift(Y, origin="mid")



