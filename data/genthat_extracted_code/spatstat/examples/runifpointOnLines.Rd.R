library(spatstat)


### Name: runifpointOnLines
### Title: Generate N Uniform Random Points On Line Segments
### Aliases: runifpointOnLines
### Keywords: spatial datagen

### ** Examples

  X <- psp(runif(10), runif(10), runif(10), runif(10),  window=owin())
  Y <- runifpointOnLines(20, X)
  plot(X, main="")
  plot(Y, add=TRUE)
  Z <- runifpointOnLines(c(5,5), X)



