library(spatstat)


### Name: pairdist.psp
### Title: Pairwise distances between line segments
### Aliases: pairdist.psp
### Keywords: spatial math

### ** Examples

   L <- psp(runif(10), runif(10), runif(10), runif(10), owin())
   D <- pairdist(L)
   S <- pairdist(L, type="sep")



