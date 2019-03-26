library(raster)


### Name: aggregate
### Title: Aggregate raster cells or SpatialPolygons/Lines
### Aliases: aggregate aggregate,Raster-method
###   aggregate,SpatialPolygons-method aggregate,SpatialLines-method
### Keywords: methods spatial

### ** Examples

r <- raster()
# a new aggregated raster, no values
ra <- aggregate(r, fact=10)
r <- setValues(r, runif(ncell(r)))

# a new aggregated raster, max of the values
ra <- aggregate(r, fact=10, fun=max)

# multiple layers
s <- stack(r, r*2)
x <- aggregate(s,2)

#SpatialPolygons
if (require(rgdal) & require(rgeos)) {
	p <- shapefile(system.file("external/lux.shp", package="raster"))
	p
	pa0 <- aggregate(p)
	pa0
	pa1 <- aggregate(p, by='NAME_1', sums=list(list(mean, 'ID_2')))
	pa1
}



