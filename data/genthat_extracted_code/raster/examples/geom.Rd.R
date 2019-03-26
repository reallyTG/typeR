library(raster)


### Name: geom
### Title: Get the coordinates of a vector type Spatial* object
### Aliases: geom geom,SpatialPolygons-method geom,SpatialLines-method
###   geom,SpatialPoints-method
### Keywords: methods spatial

### ** Examples

p <- readRDS(system.file("external/lux.rds", package="raster"))
x <- geom(p)
head(x)
	
# and back to a SpatialPolygonsDataFrame	
x <- data.frame(x)
sp <- as(x, "SpatialPolygons")
crs(sp) <- crs(p)
spdf <- SpatialPolygonsDataFrame(sp, data.frame(p), match.ID=FALSE)



