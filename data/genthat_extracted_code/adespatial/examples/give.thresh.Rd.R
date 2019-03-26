library(adespatial)


### Name: give.thresh
### Title: Compute the maximum distance of the minimum spanning tree based
###   on a distance matrix
### Aliases: give.thresh

### ** Examples

xy <- matrix(rnorm(60),30,2)
dxy <- dist(xy)
th <- give.thresh(dxy)



