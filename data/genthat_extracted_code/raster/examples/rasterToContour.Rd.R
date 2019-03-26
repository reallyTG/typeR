library(raster)


### Name: rasterToContour
### Title: Raster to contour lines conversion
### Aliases: rasterToContour
### Keywords: spatial

### ** Examples

f <- system.file("external/test.grd", package="raster")
r <- raster(f)
x <- rasterToContour(r)
class(x)
plot(r)
plot(x, add=TRUE)



