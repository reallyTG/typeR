library(BIEN)


### Name: BIEN_ranges_spatialpolygons
### Title: Download range maps that intersect a user-supplied
###   SpatialPolygons object.
### Aliases: BIEN_ranges_spatialpolygons

### ** Examples

## Not run: 
##D library(rgdal)
##D BIEN_ranges_species("Carnegiea gigantea")#saves ranges to the current working directory
##D shape<-readOGR(dsn = ".",layer = "Carnegiea_gigantea")
##D #spatialpolygons should be read with readOGR(), see note.
##D BIEN_ranges_spatialpolygons(spatialpolygons = shape) 
##D #Note that this will save many SpatialPolygonsDataFrames to the working directory.
## End(Not run)



