library(interp)


### Name: plot.voronoi
### Title: Plot a voronoi object
### Aliases: plot.voronoi
### Keywords: spatial

### ** Examples

data(franke)
tr <- tri.mesh(franke$ds3)
vr <- voronoi.mosaic(tr)
plot(tr)
plot(vr,add=TRUE)



