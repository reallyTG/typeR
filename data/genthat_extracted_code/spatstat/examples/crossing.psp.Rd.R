library(spatstat)


### Name: crossing.psp
### Title: Crossing Points of Two Line Segment Patterns
### Aliases: crossing.psp
### Keywords: spatial manip

### ** Examples

  a <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  b <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  plot(a, col="green", main="crossing.psp")
  plot(b, add=TRUE, col="blue")
  P <- crossing.psp(a,b)
  plot(P, add=TRUE, col="red")
  as.data.frame(crossing.psp(a,b,details=TRUE))



