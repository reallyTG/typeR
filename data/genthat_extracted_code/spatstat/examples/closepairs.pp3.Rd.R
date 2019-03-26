library(spatstat)


### Name: closepairs.pp3
### Title: Close Pairs of Points in 3 Dimensions
### Aliases: closepairs.pp3 crosspairs.pp3
### Keywords: spatial math

### ** Examples

   X <- pp3(runif(10), runif(10), runif(10), box3(c(0,1)))
   Y <- pp3(runif(10), runif(10), runif(10), box3(c(0,1)))
   a <- closepairs(X, 0.1)
   b <- crosspairs(X, Y, 0.1)



