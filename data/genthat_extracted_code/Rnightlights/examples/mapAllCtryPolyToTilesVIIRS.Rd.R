library(Rnightlights)


### Name: mapAllCtryPolyToTilesVIIRS
### Title: Create a mapping of all countries and the tiles they intersect
### Aliases: mapAllCtryPolyToTilesVIIRS

### ** Examples

#no countries omitted
## Not run: 
##D tileMap <- Rnightlights:::mapAllCtryPolyToTilesVIIRS()
## End(Not run)

#no countries omitted
## Not run: 
##D tileMap <- Rnightlights:::mapAllCtryPolyToTilesVIIRS(omitCountries="none")
## End(Not run)

#include countries that take long to process
## Not run: 
##D tileMap <- Rnightlights:::mapAllCtryPolyToTilesVIIRS(omitCountries=c("error", "long"))
## End(Not run)




