library(spatstat)


### Name: maxnndist
### Title: Compute Minimum or Maximum Nearest-Neighbour Distance
### Aliases: maxnndist minnndist
### Keywords: spatial math

### ** Examples

  min(nndist(swedishpines))
  minnndist(swedishpines)

  max(nndist(swedishpines))
  maxnndist(swedishpines)

  minnndist(lansing, positive=TRUE)

  if(interactive()) {
     X <- rpoispp(1e6)
     system.time(min(nndist(X)))
     system.time(minnndist(X))
  }



