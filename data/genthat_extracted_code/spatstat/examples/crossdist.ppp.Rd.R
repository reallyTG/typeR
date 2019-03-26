library(spatstat)


### Name: crossdist.ppp
### Title: Pairwise distances between two different point patterns
### Aliases: crossdist.ppp
### Keywords: spatial math

### ** Examples

   data(cells)
   d <- crossdist(cells, runifpoint(6))
   d <- crossdist(cells, runifpoint(6), periodic=TRUE)



