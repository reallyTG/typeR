library(osmplotr)


### Name: extract_osm_objects
### Title: extract_osm_objects
### Aliases: extract_osm_objects

### ** Examples

## Not run: 
##D bbox <- get_bbox (c(-0.13,51.50,-0.11,51.52))
##D dat_B <- extract_osm_objects (key = 'building', bbox = bbox)
##D dat_H <- extract_osm_objects (key = 'highway', bbox = bbox)
##D dat_BR <- extract_osm_objects (key = 'building', value = 'residential',
##D                                bbox = bbox)
##D dat_HP <- extract_osm_objects (key = 'highway', value = 'primary', bbox = bbox)
##D dat_HNP <- extract_osm_objects (key = 'highway', value = '!primary', bbox = bbox)
##D extra_pairs <- c ('name', 'Royal.Festival.Hall')
##D dat <- extract_osm_objects (key = 'building', extra_pairs = extra_pairs,
##D                             bbox = bbox)
## End(Not run)



