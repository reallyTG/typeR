library(rangeMapper)


### Name: rangeTraits
### Title: A container of functions to apply on a 'SpatialPolygons' object
### Aliases: rangeTraits

### ** Examples

summary(rangeTraits(use.default = FALSE))

f = system.file(package = "rangeMapper", "extdata", "wrens", "vector")
troaed = selectShpFiles(f, ogr = TRUE,
	polygons.only = TRUE)[71, ] # path to Troglodytes_aedon
require(rgdal)
r = readOGR(troaed$dsn, troaed$layer)

# Beware of the value returned for Area!
sapply(rangeTraits(), function(x) x(r) )

# Define an extra function to compute correct Area
Area2 = function(x) {
x = spTransform(x,
CRS("+proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0 +ellps=WGS84 +units=m +no_defs")
	)

sum(sapply(slot(x, "polygons"), function(x) slot(x, "area") ))
}

sapply(rangeTraits(Area_sqm = Area2), function(x) x(r) )






