library(spatstat)


### Name: selfcrossing.psp
### Title: Crossing Points in a Line Segment Pattern
### Aliases: selfcrossing.psp
### Keywords: spatial manip

### ** Examples

  a <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  plot(a, col="green", main="selfcrossing.psp")
  P <- selfcrossing.psp(a)
  plot(P, add=TRUE, col="red")



