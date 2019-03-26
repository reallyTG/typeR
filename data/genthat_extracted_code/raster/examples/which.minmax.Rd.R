library(raster)


### Name: which.min
### Title: Where is the min or max value?
### Aliases: which.min which.max whiches.min whiches.max
###   which.min,RasterLayer-method which.max,RasterLayer-method
###   which.min,RasterStackBrick-method which.max,RasterStackBrick-method
###   whiches.min,RasterStackBrick-method
###   whiches.max,RasterStackBrick-method
### Keywords: spatial

### ** Examples

b <- brick(system.file("external/rlogo.grd", package="raster")) 

r <- which.min(b)

i <- which.min(b[[3]])
xy <- xyFromCell(b, i)
plot(b[[3]])
points(xy)

x <- whiches.min(b)
freq(x)




