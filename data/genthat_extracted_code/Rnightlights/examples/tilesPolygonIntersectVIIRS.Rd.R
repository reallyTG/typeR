library(Rnightlights)


### Name: tilesPolygonIntersectVIIRS
### Title: Get the list of VIIRS tiles that a polygon intersects with
### Aliases: tilesPolygonIntersectVIIRS

### ** Examples

## Not run: 
##D #download shapefile if it doesn't exist
##D ctryShapefile <- Rnightlights:::dnldCtryPoly("KEN")
##D 
##D #read in shapefile top layer
##D ctryPoly <- readCtryPolyAdmLayer("KEN", 
##D     Rnightlights:::getCtryShpLyrNames("KEN",0))
##D 
##D #get list of intersecting tiles
##D tileList <- Rnightlights:::tilesPolygonIntersectVIIRS(ctryPoly)
## End(Not run)




