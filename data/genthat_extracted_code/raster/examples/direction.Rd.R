library(raster)


### Name: direction
### Title: Direction
### Aliases: direction direction,RasterLayer-method
### Keywords: spatial

### ** Examples

r <- raster(ncol=36,nrow=18)
r[] <- NA
r[306] <- 1
b <- direction(r) 
#plot(b)



