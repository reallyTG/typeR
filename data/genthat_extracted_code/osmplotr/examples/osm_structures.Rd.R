library(osmplotr)


### Name: osm_structures
### Title: osm_structures
### Aliases: osm_structures

### ** Examples

# Default structures:
osm_structures ()
# user-defined structures:
structures <- c ('highway', 'park', 'ameniiy', 'tree')
structs <- osm_structures (structures = structures, col_scheme = 'light')
# make_osm_map returns potentially modified list of data
## Not run: 
##D dat <- make_osm_map (osm_data = london, structures = structs)
##D # map contains updated $osm_data and actual map in $map
##D print_osm_map (dat$map)
## End(Not run)



