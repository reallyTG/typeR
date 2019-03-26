library(raster)


### Name: crop
### Title: Crop
### Aliases: crop crop,Raster-method crop,Spatial-method
### Keywords: spatial

### ** Examples

r <- raster(nrow=45, ncol=90)
r[] <- 1:ncell(r)
e <- extent(-160, 10, 30, 60)
rc <- crop(r, e)	

# use row and column numbers:
rc2 <- crop(r, extent(r, 5, 10, 7, 15))

# crop Raster* with Spatial* object
b <- as(extent(6, 6.4, 49.75, 50), 'SpatialPolygons')
crs(b) <- crs(r)
rb <- crop(r, b)

# crop a SpatialPolygon* object with another one
if (require(rgdal) & require(rgeos)) {
  p <- shapefile(system.file("external/lux.shp", package="raster"))
  pb <- crop(p, b)
}



