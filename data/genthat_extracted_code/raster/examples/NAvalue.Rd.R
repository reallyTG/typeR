library(raster)


### Name: NAvalue
### Title: Set the NA value of a RasterLayer
### Aliases: NAvalue<- NAvalue
### Keywords: spatial

### ** Examples
 
r1 <- raster(system.file("external/rlogo.grd", package="raster"))
r2 <- r1
NAvalue(r2)
NAvalue(r2) <- 255
#plot(r1)
#x11()
#plot(r2)



