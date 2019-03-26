library(rnoaa)


### Name: ghcnd_stations
### Title: Get information on the GHCND weather stations
### Aliases: ghcnd_stations

### ** Examples

## Not run: 
##D # Get stations, ghcnd-stations and ghcnd-inventory merged
##D (stations <- ghcnd_stations())
##D 
##D library(dplyr)
##D # filter by state
##D stations %>% filter(state == "IL")
##D stations %>% filter(state == "OR")
##D # those without state values
##D stations %>% filter(state == "")
##D # filter by element
##D stations %>% filter(element == "PRCP")
##D # filter by id prefix
##D stations %>% filter(grepl("^AF", id))
##D stations %>% filter(grepl("^AFM", id))
##D # filter by station long name
##D stations %>% filter(name == "CALLATHARRA")
## End(Not run)



