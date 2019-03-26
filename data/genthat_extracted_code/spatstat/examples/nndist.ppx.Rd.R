library(spatstat)


### Name: nndist.ppx
### Title: Nearest Neighbour Distances in Any Dimensions
### Aliases: nndist.ppx
### Keywords: spatial math

### ** Examples

   df <- data.frame(x=runif(5),y=runif(5),z=runif(5),w=runif(5))
   X <- ppx(data=df)

   # nearest neighbours
   d <- nndist(X)

   # second nearest neighbours
   d2 <- nndist(X, k=2)

   # first, second and third nearest
   d1to3 <- nndist(X, k=1:3)



