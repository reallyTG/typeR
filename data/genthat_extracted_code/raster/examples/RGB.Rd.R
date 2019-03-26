library(raster)


### Name: RGB
### Title: Create a Red-Green-Blue Raster object
### Aliases: RGB RGB,RasterLayer-method
### Keywords: methods spatial

### ** Examples

r <- raster(system.file("external/test.grd", package="raster"))
x <- RGB(r)
plot(x, col=gray(0:9/10))
plotRGB(x)



