library(Rnightlights)


### Name: mapCtryPolyToTilesVIIRS
### Title: Create a mapping of all countries and the tiles they intersect
### Aliases: mapCtryPolyToTilesVIIRS

### ** Examples

#map all countries
## Not run: 
##D tileMap <- Rnightlights:::mapCtryPolyToTilesVIIRS()
## End(Not run)

#map all countries, no countries omitted
## Not run: 
##D tileMap <- Rnightlights:::mapCtryPolyToTilesVIIRS(ctryCodes="all", omitCountries="none")
## End(Not run)

#will not omit countries that do not have polygons on GADM
## Not run: 
##D tileMap <- Rnightlights:::mapCtryPolyToTilesVIIRS(omitCountries=c("error", "missing"))
## End(Not run)




