library(Rvcg)


### Name: vcgMeshres
### Title: calculates the average edge length of a triangular mesh
### Aliases: vcgMeshres
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(humface)
mres <- vcgMeshres(humface)
#histogram of edgelength distribution
hist(mres$edgelength)
#visualise average edgelength
points( mres$res, 1000, pch=20, col=2, cex=2)



