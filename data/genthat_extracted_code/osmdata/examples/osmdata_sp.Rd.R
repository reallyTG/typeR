library(osmdata)


### Name: osmdata_sp
### Title: Return an OSM Overpass query as an osmdata object in 'sp'
###   format.
### Aliases: osmdata_sp

### ** Examples

## Not run: 
##D hampi_sp <- opq ("hampi india") %>%
##D             add_osm_feature (key="historic", value="ruins") %>%
##D             osmdata_sp ()
## End(Not run)



