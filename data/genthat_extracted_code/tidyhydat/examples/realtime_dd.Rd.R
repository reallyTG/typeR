library(tidyhydat)


### Name: realtime_dd
### Title: Download a tibble of realtime river data from the last 30 days
###   from the Meteorological Service of Canada datamart
### Aliases: realtime_dd

### ** Examples

## Not run: 
##D ## Download from multiple provinces
##D realtime_dd(station_number=c("01CD005","08MF005"))
##D 
##D # To download all stations in Prince Edward Island:
##D realtime_dd(prov_terr_state_loc = "PE")
## End(Not run)




