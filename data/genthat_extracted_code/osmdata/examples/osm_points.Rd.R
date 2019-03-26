library(osmdata)


### Name: osm_points
### Title: Extract all 'osm_points' from an osmdata object
### Aliases: osm_points

### ** Examples

## Not run: 
##D tr <- opq ("trentham australia") %>% osmdata_sf ()
##D coliban <- tr$osm_lines [which (tr$osm_lines$name == 'Coliban River'),]
##D pts <- osm_points (tr, rownames (coliban)) # all points of river
##D waterfall <- pts [which (pts$waterway == 'waterfall'),] # the waterfall point
## End(Not run)



