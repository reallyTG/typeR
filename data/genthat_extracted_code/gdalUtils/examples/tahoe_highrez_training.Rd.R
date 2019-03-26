library(gdalUtils)


### Name: tahoe_highrez_training
### Title: Point and polygon files for use with gdalUtils
### Aliases: tahoe_highrez_training
### Keywords: data

### ** Examples

## Not run: 
##D tahoe_highrez_training_polygons <- readOGR(
##D 	dsn=system.file("external", package="gdalUtils"),layer="tahoe_highrez_training")
##D spplot(tahoe_highrez_training_polygons,zcol="Class")
##D tahoe_highrez_training_points <- readOGR(
##D 	dsn=system.file("external", package="gdalUtils"),layer="tahoe_highrez_training_points")
##D spplot(tahoe_highrez_training_points,zcol="SPECIES")
## End(Not run)



