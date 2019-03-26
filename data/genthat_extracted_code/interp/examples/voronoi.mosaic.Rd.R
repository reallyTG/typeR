library(interp)


### Name: voronoi.mosaic
### Title: Voronoi mosaic
### Aliases: voronoi.mosaic
### Keywords: spatial

### ** Examples

data(franke)
fd <- franke$ds3
vr <- voronoi.mosaic(fd$x, fd$y)
summary(vr)



