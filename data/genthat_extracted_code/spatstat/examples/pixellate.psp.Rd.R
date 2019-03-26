library(spatstat)


### Name: pixellate.psp
### Title: Convert Line Segment Pattern to Pixel Image
### Aliases: pixellate.psp
### Keywords: spatial manip

### ** Examples

  X <- psp(runif(10),runif(10), runif(10), runif(10), window=owin())
  plot(pixellate(X))
  plot(X, add=TRUE)
  sum(lengths.psp(X))
  sum(pixellate(X))
  plot(pixellate(X, what="n"))



