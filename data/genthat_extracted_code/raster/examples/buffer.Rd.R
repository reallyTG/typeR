library(raster)


### Name: buffer
### Title: buffer
### Aliases: buffer buffer,RasterLayer-method buffer,Spatial-method
### Keywords: spatial

### ** Examples

r <- raster(ncol=36,nrow=18)
r[] <- NA
r[500] <- 1
b <- buffer(r, width=5000000) 
#plot(b)



