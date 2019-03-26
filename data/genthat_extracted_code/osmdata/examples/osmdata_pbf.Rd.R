library(osmdata)


### Name: osmdata_pbf
### Title: Return an OSM Overpass query in PBF (Protocol Buffer Format).
### Aliases: osmdata_pbf

### ** Examples

## Not run: 
##D q <- opq ("hampi india")
##D q <- add_osm_feature (q, key="historic", value="ruins")
##D osmdata_pdf (q, filename="hampi.pbf")
## End(Not run)



