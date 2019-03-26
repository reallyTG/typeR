library(mregions)


### Name: mregions-package
### Title: Marine regions data from Marineregions
### Aliases: mregions-package mregions
### Keywords: package

### ** Examples

## Not run: 
##D ## GeoJSON
##D ### Get region
##D res <- mr_geojson(key = "Morocco:dam")
##D 
##D ### Plot data
##D if (!requireNamespace("leaflet")) {
##D  install.packages("leaflet")
##D }
##D library('leaflet')
##D leaflet() %>%
##D   addProviderTiles(provider = 'OpenStreetMap') %>%
##D   addGeoJSON(geojson = res$features) %>%
##D   setView(-3.98, 35.1, zoom = 11)
##D 
##D ## Shape
##D ### Get region
##D res <- mr_shp(key = "MarineRegions:eez_iho_union_v2")
##D library('leaflet')
##D leaflet() %>%
##D   addProviderTiles(provider = 'OpenStreetMap') %>%
##D   addPolygons(data = res)
##D 
##D ## Convert to WKT
##D ### From geojson
##D res <- mr_geojson(key = "Morocco:dam")
##D mr_as_wkt(res, fmt = 5)
##D 
##D ### From shp object (`SpatialPolygonsDataFrame`) or file, both work
##D mr_as_wkt(mr_shp(key = "Morocco:dam", read = FALSE))
##D ## spatial object to wkt
##D mr_as_wkt(mr_shp(key = "Morocco:dam", read = TRUE))
## End(Not run)



