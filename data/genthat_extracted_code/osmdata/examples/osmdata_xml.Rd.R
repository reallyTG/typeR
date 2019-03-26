library(osmdata)


### Name: osmdata_xml
### Title: Return an OSM Overpass query in XML format Read an (XML format)
###   OSM Overpass response from a string, a connection, or a raw vector.
### Aliases: osmdata_xml

### ** Examples

## Not run: 
##D q <- opq ("hampi india")
##D q <- add_osm_feature (q, key="historic", value="ruins")
##D osmdata_xml (q, filename="hampi.osm")
## End(Not run)



