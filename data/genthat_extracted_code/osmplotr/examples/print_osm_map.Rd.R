library(osmplotr)


### Name: print_osm_map
### Title: print_osm_map
### Aliases: print_osm_map

### ** Examples

bbox <- get_bbox (c (-0.13, 51.5, -0.11, 51.52))
map <- osm_basemap (bbox = bbox, bg = 'gray20')
map <- add_osm_objects (map, london$dat_BNR, col = 'gray40') 
print_osm_map (map, width = 7) # prints to screen device
## Not run: 
##D print_osm_map (map, file = 'map.png', width = 500, units = 'px')
## End(Not run)



