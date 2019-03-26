library(malariaAtlas)


### Name: as.MAPshp
### Title: Convert SpatialPolygon objects into MAPshp objects
### Aliases: as.MAPshp

### ** Examples

#Download shapefiles for Madagascar and visualise these on a map.

## No test: 
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
MDG_shp <- as.MAPshp(MDG_shp)
autoplot(MDG_shp)
## End(No test)




