library(spatstat)


### Name: nndist.psp
### Title: Nearest neighbour distances between line segments
### Aliases: nndist.psp
### Keywords: spatial math

### ** Examples

   L <- psp(runif(10), runif(10), runif(10), runif(10), owin())
   D <- nndist(L)
   D <- nndist(L, k=1:3)



