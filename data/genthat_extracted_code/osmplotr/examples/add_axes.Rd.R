library(osmplotr)


### Name: add_axes
### Title: add_axes
### Aliases: add_axes

### ** Examples

bbox <- get_bbox (c (-0.13, 51.5, -0.11, 51.52))
map <- osm_basemap (bbox = bbox, bg = "gray20")
map <- add_osm_objects (map, london$dat_BNR, col = "gray40") 
map <- add_axes (map)
print (map)

# Map items are added sequentially, so adding axes prior to objects will
# produce a different result.
map <- osm_basemap (bbox = bbox, bg = "gray20")
map <- add_axes (map)
map <- add_osm_objects (map, london$dat_BNR, col = "gray40") 
print_osm_map (map)



