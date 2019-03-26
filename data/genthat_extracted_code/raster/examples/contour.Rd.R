library(raster)


### Name: contour
### Title: Contour plot
### Aliases: contour contour,RasterLayer-method
### Keywords: methods spatial

### ** Examples

r <- raster(system.file("external/test.grd", package="raster"))
plot(r)
contour(r, add=TRUE)



