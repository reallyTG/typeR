library(spatstat)


### Name: endpoints.psp
### Title: Endpoints of Line Segment Pattern
### Aliases: endpoints.psp
### Keywords: spatial manip

### ** Examples

  a <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  plot(a)
  b <- endpoints.psp(a, "left")
  plot(b, add=TRUE)



