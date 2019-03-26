library(spatstat)


### Name: crossdist.ppx
### Title: Pairwise Distances Between Two Different Multi-Dimensional Point
###   Patterns
### Aliases: crossdist.ppx
### Keywords: spatial math

### ** Examples

   df <- data.frame(x=runif(3),y=runif(3),z=runif(3),w=runif(3))
   X <- ppx(data=df)
   df <- data.frame(x=runif(5),y=runif(5),z=runif(5),w=runif(5))
   Y <- ppx(data=df)
   d <- crossdist(X, Y)



