library(synthACS)


### Name: pull_acs_basetables
### Title: Pull ACS base tables
### Aliases: pull_acs_basetables

### ** Examples

## Not run: 
##D # make geography
##D la_geo <- acs::geo.make(state= "CA", county= "Los Angeles City")
##D # pull data 
##D la_dat <- pull_acs_basetables(endyear= 2015, span= 1, geography= la_geo, 
##D   table_vec= c("B00001", "B00002", "B01003"))
## End(Not run)



