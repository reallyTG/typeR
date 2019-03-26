library(osmdata)


### Name: osm_lines
### Title: Extract all 'osm_lines' from an osmdata object
### Aliases: osm_lines

### ** Examples

## Not run: 
##D dat <- opq ("hengelo nl") %>% add_osm_feature (key="highway") %>%
##D      osmdata_sf ()
##D bus <- dat$osm_points [which (dat$osm_points$highway == 'bus_stop'),] %>%
##D         rownames () # all OSM IDs of bus stops
##D osm_lines (dat, bus) # all highways containing bus stops
##D 
##D # All lines which intersect with Piccadilly Circus in London, UK
##D dat <- opq ("Fitzrovia London") %>% add_osm_feature (key="highway") %>% 
##D     osmdata_sf ()
##D i <- which (dat$osm_polygons$name == "Piccadilly Circus")
##D id <- rownames (dat$osm_polygons [i,])
##D osm_lines (dat, id)
## End(Not run)



