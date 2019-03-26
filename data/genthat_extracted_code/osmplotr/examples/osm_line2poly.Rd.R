library(osmplotr)


### Name: osm_line2poly
### Title: osm_line2poly
### Aliases: osm_line2poly

### ** Examples

# This example uses the \code{osmdata} package to extract data from 
# a named bounding box
## Not run: 
##D library (magrittr)
##D library (osmdata)
##D bb <- osmdata::getbb ("melbourne, australia")
##D coast <- extract_osm_objects (bbox = bb, key = "natural", value = "coastline",
##D                               return_type = "line")
##D coast <- osm_line2poly (coast, bbox = bb)
##D # The following map then colours in just the ocean:
##D map <- osm_basemap (bbox = bb) %>%
##D     add_osm_objects (coast$sea, col = "lightsteelblue") %>%
##D     print_osm_map ()
## End(Not run)



