library(spatstat)


### Name: nndist.pp3
### Title: Nearest neighbour distances in three dimensions
### Aliases: nndist.pp3
### Keywords: spatial math

### ** Examples

   X <- runifpoint3(40)

   # nearest neighbours
   d <- nndist(X)

   # second nearest neighbours
   d2 <- nndist(X, k=2)

   # first, second and third nearest
   d1to3 <- nndist(X, k=1:3)



