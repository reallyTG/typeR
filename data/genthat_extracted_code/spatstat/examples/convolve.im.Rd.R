library(spatstat)


### Name: convolve.im
### Title: Convolution of Pixel Images
### Aliases: convolve.im
### Keywords: spatial math

### ** Examples

  X <- as.im(letterR)
  Y <- as.im(square(1))
  plot(convolve.im(X, Y))
  plot(convolve.im(X, Y, reflectX=TRUE))
  plot(convolve.im(X))



