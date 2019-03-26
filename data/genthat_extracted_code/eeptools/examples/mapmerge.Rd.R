library(eeptools)


### Name: mapmerge
### Title: A depcrecated method for converting polygons to dataframes
###   Combine an S4 polygon object with a dataframe
### Aliases: mapmerge

### ** Examples

## Not run: 
##D xx <- maptools::readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], IDvar="FIPSNO")
##D yy <- as(xx,"data.frame")
##D yy$newvar <- sample(letters, nrow(yy), replace=TRUE)
##D yy <- subset(yy, select=c("FIPS", "newvar"))
##D newpoly <- mapmerge(xx, yy, xid="FIPS", yid="FIPS")
## End(Not run)



