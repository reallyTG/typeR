library(osmplotr)


### Name: adjust_colours
### Title: adjust_colours
### Aliases: adjust_colours

### ** Examples

cols <- adjust_colours (cols = heat.colors (10), adj = -0.2, plot = TRUE)

# 'adjust_colours' also offers an easy way to adjust the default colour
# schemes provided by 'osm_structures'. The following lines darken the
# highway colour of the 'light' colour scheme by 20%
structures <- osm_structures (structures = c('building', 'highway', 'park'),
                              col_scheme = 'light')
structures$cols [2] <- adjust_colours (structures$cols [2], adj = -0.2)
# Plot these structures:
bbox <- get_bbox (c (-0.13, 51.5, -0.11, 51.52))
## Not run: 
##D dat_B <- extract_osm_objects (key = 'building', bbox = bbox)
##D dat_H <- extract_osm_objects (key = 'highway', bbox = bbox)
##D dat_P <- extract_osm_objects (key = 'park', bbox = bbox)
## End(Not run)
# These data are also included in the 'london' data of 'osmplotr'
osm_data <- list (dat_B = london$dat_BNR, dat_H = london$dat_HP, dat_P = london$dat_P)
dat <- make_osm_map (structures = structures, osm_data = osm_data, bbox = bbox)
print_osm_map (dat$map)



