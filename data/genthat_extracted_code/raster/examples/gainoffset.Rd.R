library(raster)


### Name: Gain and offset
### Title: Gain and offset of values on file
### Aliases: gain offs gain<- offs<-
### Keywords: spatial methods

### ** Examples
 
r <- raster(system.file("external/test.grd", package="raster"))
gain(r)
offs(r)
r[1505:1510]
gain(r) <- 10
offs(r) <- 5
r[1505:1510]



