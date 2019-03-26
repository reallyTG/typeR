library(spatstat)


### Name: crossdist.pp3
### Title: Pairwise distances between two different three-dimensional point
###   patterns
### Aliases: crossdist.pp3
### Keywords: spatial math

### ** Examples

   X <- runifpoint3(20)
   Y <- runifpoint3(30)
   d <- crossdist(X, Y)
   d <- crossdist(X, Y, periodic=TRUE)



