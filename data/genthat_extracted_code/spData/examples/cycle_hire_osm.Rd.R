library(spData)


### Name: cycle_hire_osm
### Title: Cycle hire points in London from OSM
### Aliases: cycle_hire_osm
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(cycle_hire_osm)
  # or
  cycle_hire_osm <- st_read(system.file("shapes/cycle_hire_osm.geojson", package="spData"))
  
  plot(cycle_hire_osm)
}

# Code used to download the data:
## Not run: 
##D library(osmdata)
##D library(dplyr)
##D library(sf)
##D q = add_osm_feature(opq = opq("London"), key = "network", value = "tfl_cycle_hire")
##D lnd_cycle_hire = osmdata_sf(q)
##D cycle_hire_osm = lnd_cycle_hire$osm_points
##D nrow(cycle_hire_osm)
##D plot(cycle_hire_osm)
##D cycle_hire_osm = dplyr::select(cycle_hire_osm, osm_id, name, capacity, 
##D                                cyclestreets_id, description) %>%
##D   mutate(capacity = as.numeric(capacity))
##D names(cycle_hire_osm)
##D nrow(cycle_hire_osm)
## End(Not run)



