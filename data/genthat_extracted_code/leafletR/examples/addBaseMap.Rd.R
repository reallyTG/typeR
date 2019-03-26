library(leafletR)


### Name: addBaseMap
### Title: Add custom base maps
### Aliases: addBaseMap base
### Keywords: methods

### ** Examples

## Not run: 
##D # duplicates osm base map
##D addBaseMap(
##D   name="myosm", 
##D   title="Duplicated OpenStreetMap", 
##D   url="http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
##D   options=list(
##D     attribution='&copy; <a href="http://openstreetmap.org/copyright", target=
##D       "_blank">OpenStreetMap contributors</a>'
##D   )
##D )
##D 
##D map <- leaflet(base.map="myosm", dest=tempdir())
## End(Not run)



