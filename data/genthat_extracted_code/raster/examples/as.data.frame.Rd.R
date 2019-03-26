library(raster)


### Name: as.data.frame
### Title: Get a data.frame with raster cell values, or coerce
###   SpatialPolygons, Lines, or Points to a data.frame
### Aliases: as.data.frame as.data.frame,Raster-method
###   as.data.frame,SpatialPolygons-method
###   as.data.frame,SpatialLines-method
### Keywords: spatial methods

### ** Examples

r <- raster(ncol=3, nrow=3)
r[] <- sqrt(1:ncell(r))
r[3:5] <- NA
as.data.frame(r)
s <- stack(r, r*2)
as.data.frame(s)
as.data.frame(s, na.rm=TRUE)



