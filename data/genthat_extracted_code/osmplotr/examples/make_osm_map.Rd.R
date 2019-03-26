library(osmplotr)


### Name: make_osm_map
### Title: make_osm_map
### Aliases: make_osm_map

### ** Examples

structures <- c ('highway', 'park')
structs <- osm_structures (structures = structures, col_scheme = 'light')
# make_osm_map returns potentially modified list of data using the provided
# 'london' data for highways and parks.
dat <- make_osm_map (osm_data = london, structures = structs)
# or download data automatically using a defined bounding boox
bbox <- get_bbox (c(-0.15,51.5,-0.10,51.52))
## Not run: 
##D dat <- make_osm_map (bbox = bbox, structures = structs)
##D print_osm_map (dat$map)
## End(Not run)



