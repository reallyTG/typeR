library(raster)


### Name: cover
### Title: Replace NA values with values of other layers
### Aliases: cover cover,RasterLayer,RasterLayer-method
###   cover,RasterStackBrick,Raster-method
###   cover,SpatialPolygons,SpatialPolygons-method
### Keywords: methods spatial

### ** Examples

# raster objects
r1 <- raster(ncols=36, nrows=18)
r1[] <- 1:ncell(r1)
r2 <- setValues(r1, runif(ncell(r1)))
r2[r2 < 0.5] <- NA
r3 <- cover(r2, r1)


#SpatialPolygons
if (require(rgdal) & require(rgeos)) {
	p <- shapefile(system.file("external/lux.shp", package="raster"))
	b <- as(extent(6, 6.4, 49.75, 50), 'SpatialPolygons')
	crs(b) <- crs(p)
	b <- SpatialPolygonsDataFrame(b, data.frame(ID_1=9))
	
	cv1 <- cover(p, b)
	cv2 <- cover(p, b, identity=TRUE)
}



