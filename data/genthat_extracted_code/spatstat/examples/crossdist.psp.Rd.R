library(spatstat)


### Name: crossdist.psp
### Title: Pairwise distances between two different line segment patterns
### Aliases: crossdist.psp
### Keywords: spatial math

### ** Examples

   L1 <- psp(runif(5), runif(5), runif(5), runif(5), owin())
   L2 <- psp(runif(10), runif(10), runif(10), runif(10), owin())
   D <- crossdist(L1, L2)
   #result is a 5 x 10 matrix
   S <- crossdist(L1, L2, type="sep")



