library(osmplotr)


### Name: osm_basemap
### Title: osm_basemap
### Aliases: osm_basemap

### ** Examples

bbox <- get_bbox (c (-0.13, 51.5, -0.11, 51.52))
map <- osm_basemap (bbox = bbox, bg = 'gray20')
map <- add_osm_objects (map, london$dat_BNR, col = 'gray40') 
print_osm_map (map)



