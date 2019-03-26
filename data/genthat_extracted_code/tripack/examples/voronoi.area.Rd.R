library(tripack)


### Name: voronoi.area
### Title: Calculate area of Voronoi polygons
### Aliases: voronoi.area
### Keywords: spatial

### ** Examples

data(tritest)
tritest.vm <- voronoi.mosaic(tritest$x,tritest$y)
tritest.vm.areas <- voronoi.area(tritest.vm)
plot(tritest.vm)
text(tritest$x, tritest$y, tritest.vm.areas)



