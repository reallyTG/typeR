library(osmar)


### Name: osmsource_osmosis
### Title: Osmosis OSM data source
### Aliases: osmsource_osmosis

### ** Examples

## Not run: 
##D     ## Download and extract a planet file:
##D     download.file("http://osmar.r-forge.r-project.org/",
##D                   "muenchen.osm.gz")
##D     system("gzip -d muenchen.osm.gz")
##D 
##D     ## Define osmosis source; note that we assume that
##D     ## osmosis is in our path environment variable (if
##D     ## not, set osmosis argument to the executable):
##D     src <- osmsource_osmosis(file = "muenchen.osm")
##D 
##D     ## Get the center of Munich:
##D     muc_bbox <- center_bbox(11.575278, 48.137222,
##D                             3000, 3000)
##D     muc <- get_osm(muc_bbox, src)
##D     muc
##D   
## End(Not run)



