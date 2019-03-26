library(sp)


### Name: surfaceArea
### Title: Compute surface area of a digital elevation model.
### Aliases: surfaceArea surfaceArea.matrix
###   surfaceArea,SpatialPixelsDataFrame-method
###   surfaceArea,SpatialGridDataFrame-method surfaceArea,matrix-method
### Keywords: spatial

### ** Examples

surfaceArea(volcano)
image(surfaceArea(volcano,byCell=TRUE))

data(meuse.grid)
gridded(meuse.grid) = ~x+y
image(surfaceArea(meuse.grid["dist"], byCell=TRUE))
surfaceArea(meuse.grid["dist"])



