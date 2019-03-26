library(raster)


### Name: erase
### Title: Erase parts of a SpatialPolygons* or SpatialLines* object. The
###   inverse of this can be done with 'intersect'
### Aliases: erase erase,SpatialPolygons,SpatialPolygons-method
###   erase,SpatialLines,SpatialPolygons-method
### Keywords: methods spatial

### ** Examples

if (require(rgdal) & require(rgeos)) {
# erase parts of polygons with other polygons
	p <- shapefile(system.file("external/lux.shp", package="raster"))
	b <- as(extent(6, 6.4, 49.75, 50), 'SpatialPolygons')
	projection(b) <- projection(p)
	e <- erase(p, b)
	plot(e)
	
	
# erase parts of lines with polygons	
	r <- raster(extent(p) +c(-.1,.1,-.1,.1), crs=crs(p))
	start <- xyFromCell(r, cellFromCol(r, 1))
	end <- xyFromCell(r, cellFromCol(r, ncol(r)))
	lines <- do.call(spLines, lapply(1:10, function(i)rbind(start[i,], end[i,])))
	crs(lines) <- crs(p)
	
	e2 <- erase(lines, p)
	plot(p)
	lines(lines, col='blue', lwd=4, lty=3)
	lines(e2, col='red', lwd=2)
}



