library(sp)


### Name: SpatialPixels-class
### Title: Class "SpatialPixels"
### Aliases: SpatialPixels-class [,SpatialPixels-method
###   coerce,SpatialPixels,SpatialGrid-method print.summary.SpatialPixels
###   as.data.frame.SpatialPixels summary,SpatialPixels-method
###   coerce,SpatialPixels,data.frame-method show,SpatialPixels-method
###   plot,SpatialPixels,missing-method rbind.SpatialPixels
### Keywords: classes

### ** Examples

data(meuse.grid)
pts = meuse.grid[c("x", "y")]
y = SpatialPixels(SpatialPoints(pts))
class(y)
y
summary(y)
plot(y) # plots grid
plot(y, grid = FALSE) # plots points



