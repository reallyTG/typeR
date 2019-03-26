library(spatstat)


### Name: as.mask.psp
### Title: Convert Line Segment Pattern to Binary Pixel Mask
### Aliases: as.mask.psp
### Keywords: spatial manip

### ** Examples

  X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  plot(as.mask.psp(X))
  plot(X, add=TRUE, col="red")



