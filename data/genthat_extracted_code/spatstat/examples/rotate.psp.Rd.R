library(spatstat)


### Name: rotate.psp
### Title: Rotate a Line Segment Pattern
### Aliases: rotate.psp
### Keywords: spatial math

### ** Examples

  oldpar <- par(mfrow=c(2,1))
  X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  plot(X, main="original")
  Y <- rotate(X, pi/4)
  plot(Y, main="rotated")
  par(oldpar)



