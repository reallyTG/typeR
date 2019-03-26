library(raster)


### Name: isLonLat
### Title: Is this longitude/latitude data?
### Aliases: isLonLat isLonLat,BasicRaster-method isLonLat,Spatial-method
###   isLonLat,CRS-method isLonLat,character-method isLonLat,ANY-method
###   couldBeLonLat
### Keywords: spatial

### ** Examples

r <- raster()
isLonLat(r)
projection(r) <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84"
isLonLat(r)



