library(McSpatial)


### Name: CookCensusTracts
### Title: Shapefile of Census Tracts in Cook County for 2000
### Aliases: CookCensusTracts
### Keywords: Datasets Maps

### ** Examples

cook <- readShapePoly(system.file("maps/CookCensusTracts.shp",
  package="McSpatial"))
sampvar <- cook$CHICAGO==1|(!is.na(cook$CAREA)&cook$CAREA=="O'Hare")
chicago <- cook[sampvar==TRUE,]




