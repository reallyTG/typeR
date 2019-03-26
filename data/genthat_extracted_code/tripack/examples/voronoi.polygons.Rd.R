library(tripack)


### Name: voronoi.polygons
### Title: extract polygons from a voronoi mosaic
### Aliases: voronoi.polygons
### Keywords: spatial

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	     or do  help(data=index)  for the standard data sets.

data(tritest)
tritest.vm <- voronoi.mosaic(tritest$x,tritest$y)
tritest.vp <- voronoi.polygons(tritest.vm)
tritest.vp



