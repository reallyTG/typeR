library(BIEN)


### Name: BIEN_occurrence_spatialpolygons
### Title: Extract occurrence data for specified SpatialPolygons or
###   SpatialPolygonsDataFrame
### Aliases: BIEN_occurrence_spatialpolygons

### ** Examples

## Not run: 
##D library(rgdal)
##D BIEN_ranges_species("Carnegiea gigantea")#saves ranges to the current working directory
##D sp<-readOGR(dsn = ".",layer = "Carnegiea_gigantea")
##D #SpatialPolygons should be read with readOGR().
##D species_occurrences<-BIEN_occurrence_spatialpolygons(spatialpolygons=sp)
## End(Not run)



