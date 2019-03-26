library(spData)


### Name: cycle_hire
### Title: Cycle hire points in London
### Aliases: cycle_hire
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(cycle_hire)
  # or
  cycle_hire <- st_read(system.file("shapes/cycle_hire.geojson", package="spData"))
  
  plot(cycle_hire)
}

## Not run: 
##D # Download the data
##D cycle_hire = readr::read_csv("http://cyclehireapp.com/cyclehirelive/cyclehire.csv", 
##D   col_names = FALSE, skip = TRUE)
##D cycle_hire = cycle_hire[c_names]
##D c_names = c("id", "name", "area", "lat", "lon", "nbikes", "nempty")
##D cycle_hire = st_sf(cycle_hire, st_multipoint(c_names[c("lon", "lat")]))
## End(Not run)



