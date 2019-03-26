library(osmplotr)


### Name: add_osm_objects
### Title: add_osm_objects
### Aliases: add_osm_objects

### ** Examples

bbox <- get_bbox (c (-0.13, 51.5, -0.11, 51.52))
map <- osm_basemap (bbox = bbox, bg = "gray20")

## Not run: 
##D # The 'london' data used below were downloaded as:
##D dat_BNR <- extract_osm_objects (bbox = bbox, key = 'building',
##D                                 value = '!residential')
##D dat_HP <- extract_osm_objects (bbox = bbox, key = 'highway',
##D                                value = 'primary')
##D dat_T <- extract_osm_objects (bbox = bbox, key = 'tree')
## End(Not run)
map <- add_osm_objects (map, obj = london$dat_BNR, col = "gray40", border = "yellow") 
map <- add_osm_objects (map, obj = london$dat_HP, col = "gray80",
                        size = 1, shape = 2)
map <- add_osm_objects (map, london$dat_T, col = "green", size = 2, shape = 1)
print_osm_map (map)

# Polygons with different coloured borders
map <- osm_basemap (bbox = bbox, bg = "gray20")
map <- add_osm_objects (map, obj = london$dat_HP, col = "gray80")
map <- add_osm_objects (map, london$dat_T, col = "green")
map <- add_osm_objects (map, obj = london$dat_BNR, col = "gray40", border = "yellow", 
                        size = 0.5)
print_osm_map (map)



