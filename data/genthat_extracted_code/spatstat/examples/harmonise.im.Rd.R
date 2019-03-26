library(spatstat)


### Name: harmonise.im
### Title: Make Pixel Images Compatible
### Aliases: harmonise.im harmonize.im
### Keywords: spatial manip

### ** Examples

   A <- setcov(square(1))
   B <- function(x,y) { x }
   G <- density(runifpoint(42))
   harmonise(X=A, Y=B, Z=G)



