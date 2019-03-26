library(spatstat)


### Name: Extract.listof
### Title: Extract or Replace Subset of a List of Things
### Aliases: [<-.listof
### Keywords: spatial manip

### ** Examples

   x <- list(A=runif(10), B=runif(10), C=runif(10))
   class(x) <- c("listof", class(x))
   x[1] <- list(A=rnorm(10))
 


