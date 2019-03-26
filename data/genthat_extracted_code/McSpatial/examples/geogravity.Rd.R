library(McSpatial)


### Name: geogravity
### Title: Gravity matrix and gravity variable calculations
### Aliases: geogravity

### ** Examples

library(spdep)
cook <- readShapePoly(system.file("maps/CookCensusTracts.shp",package="McSpatial"))
cook <- cook[cook$POPULATION>0&cook$AREA>0,]
cook$lndens <- log(cook$POPULATION/cook$AREA)
lmat <- coordinates(cook)
longitude <- lmat[,1]
latitude  <- lmat[,2]
fit <- geogravity(cook$lndens,longitude,latitude)
cook$gravity <- fit$gravity




