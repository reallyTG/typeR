library(mapedit)


### Name: editMap
### Title: Interactively Edit a Map
### Aliases: editMap editMap.leaflet editMap.mapview editMap.NULL

### ** Examples

## Not run: 
##D library(leaflet)
##D library(mapedit)
##D editMap(leaflet() %>% addTiles())
## End(Not run)
## Not run: 
##D   # demonstrate Leaflet.Draw on a layer
##D   library(sf)
##D   library(mapview)
##D   library(leaflet.extras)
##D   library(mapedit)
##D 
##D   # ?sf::sf
##D   pol = st_sfc(
##D     st_polygon(list(cbind(c(0,3,3,0,0),c(0,0,3,3,0)))),
##D     crs = 4326
##D   )
##D   mapview(pol) %>%
##D     editMap(targetLayerId = "pol")
##D 
##D   mapview(franconia[1:2,]) %>%
##D     editMap(targetLayerId = "franconia[1:2, ]")
## End(Not run)



