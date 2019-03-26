library(osmar)


### Name: osmsource_api
### Title: API OSM data source
### Aliases: osmsource_api

### ** Examples

## Not run: 
##D     api <- osmsource_api()
##D 
##D     box <- corner_bbox(11.579341, 48.15102, 11.582852, 48.1530)
##D     gschw <- get_osm(box, source = api)
##D 
##D     kaufstr <- get_osm(way(3810479))
##D     kaufstr_full <- get_osm(way(3810479), full = TRUE)
##D   
## End(Not run)



