library(spatial.tools)


### Name: bbox_to_SpatialPolygons
### Title: Create a SpatialPolygons Bounding Box
### Aliases: bbox_to_SpatialPolygons

### ** Examples

library("raster")
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
bbox_to_SpatialPolygons(tahoe_highrez)
tahoe_highrez_extent <- extent(tahoe_highrez)
bbox_to_SpatialPolygons(tahoe_highrez_extent,
	CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))
tahoe_highrez_bbox <- bbox(tahoe_highrez)
bbox_to_SpatialPolygons(tahoe_highrez_bbox,
	CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))



