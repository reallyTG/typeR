library(rasterVis)


### Name: xyLayer
### Title: xyLayer
### Aliases: xyLayer
### Keywords: spatial

### ** Examples

f <- system.file("external/test.grd", package="raster")
r <- raster(f)
dirX <- xyLayer(r, x)
dirXY <-xyLayer(r, sqrt(x^2 + y^2))
levelplot(dirXY, margin=FALSE)



