library(spatstat)


### Name: dilation
### Title: Morphological Dilation
### Aliases: dilation dilation.owin dilation.ppp dilation.psp
### Keywords: spatial math

### ** Examples

  plot(dilation(redwood, 0.05))
  points(redwood)

  plot(dilation(letterR, 0.2))
  plot(letterR, add=TRUE, lwd=2, border="red")

  X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  plot(dilation(X, 0.1))
  plot(X, add=TRUE, col="red")




