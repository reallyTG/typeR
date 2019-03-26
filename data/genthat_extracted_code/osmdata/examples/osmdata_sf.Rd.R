library(osmdata)


### Name: osmdata_sf
### Title: Return an OSM Overpass query as an osmdata object in 'sf'
###   format.
### Aliases: osmdata_sf

### ** Examples

## Not run: 
##D hampi_sf <- opq ("hampi india") %>%
##D             add_osm_feature (key="historic", value="ruins") %>%
##D             osmdata_sf ()
## End(Not run)



