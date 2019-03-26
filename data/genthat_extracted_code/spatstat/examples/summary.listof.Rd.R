library(spatstat)


### Name: summary.listof
### Title: Summary of a List of Things
### Aliases: summary.listof
### Keywords: spatial methods

### ** Examples

  x <- list(A=runif(10), B=runif(10), C=runif(10))
  class(x) <- c("listof", class(x))
  summary(x)



