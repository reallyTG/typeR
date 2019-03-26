library(raster)


### Name: rasterToPoints
### Title: Raster to points conversion
### Aliases: rasterToPoints
### Keywords: spatial

### ** Examples
 
r <- raster(nrow=18, ncol=36)
r[] <- runif(ncell(r)) * 10
r[r>8] <- NA
p <- rasterToPoints(r)
p <- rasterToPoints(r, fun=function(x){x>6})
#plot(r)
#points(p)



