library(spatstat)


### Name: density.psp
### Title: Kernel Smoothing of Line Segment Pattern or Linear Network
### Aliases: density.psp density.linnet
### Keywords: spatial methods smooth

### ** Examples

  L <- psp(runif(20),runif(20),runif(20),runif(20), window=owin())
  D <- density(L, sigma=0.03)
  plot(D, main="density(L)")
  plot(L, add=TRUE)



