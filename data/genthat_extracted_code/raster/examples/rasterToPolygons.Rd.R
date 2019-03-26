library(raster)


### Name: rasterToPolygons
### Title: Raster to polygons conversion
### Aliases: rasterToPolygons
### Keywords: spatial

### ** Examples
 
r <- raster(nrow=18, ncol=36)
r[] <- runif(ncell(r)) * 10
r[r>8] <- NA
pol <- rasterToPolygons(r, fun=function(x){x>6})

#plot(r > 6)
#plot(pol, add=TRUE, col='red')



