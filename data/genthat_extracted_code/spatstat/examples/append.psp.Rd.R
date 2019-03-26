library(spatstat)


### Name: append.psp
### Title: Combine Two Line Segment Patterns
### Aliases: append.psp
### Keywords: spatial manip

### ** Examples

  X <- psp(runif(20), runif(20), runif(20), runif(20),  window=owin())
  Y <- psp(runif(5), runif(5), runif(5), runif(5),  window=owin())
  append.psp(X,Y)



