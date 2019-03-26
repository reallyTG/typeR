library(raster)


### Name: plotRGB
### Title: Red-Green-Blue plot of a multi-layered Raster object
### Aliases: plotRGB plotRGB,RasterStackBrick-method
### Keywords: methods spatial

### ** Examples

b <- brick(system.file("external/rlogo.grd", package="raster"))
plotRGB(b)
plotRGB(b, 3, 2, 1)
plotRGB(b, 3, 2, 1, stretch='hist')



