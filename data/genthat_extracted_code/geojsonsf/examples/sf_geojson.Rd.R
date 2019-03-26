library(geojsonsf)


### Name: sf_geojson
### Title: sf to GeoJSON
### Aliases: sf_geojson

### ** Examples

## Not run: 
##D library(sf)
##D sf <- sf::st_sf(geometry = sf::st_sfc(list(sf::st_point(c(0,0)), sf::st_point(c(1,1)))))
##D sf$id <- 1:2
##D sf_geojson(sf)
##D sf_geojson(sf, atomise = T)
##D 
##D ls <- st_linestring(rbind(c(0,0),c(1,1),c(2,1)))
##D mls <- st_multilinestring(list(rbind(c(2,2),c(1,3)), rbind(c(0,0),c(1,1),c(2,1))))
##D sfc <- st_sfc(ls,mls)
##D sf <- st_sf(sfc)
##D sf_geojson( sf )
##D sf_geojson( sf, simplify = FALSE )
##D 
## End(Not run)




