library(cancensus)


### Name: as_census_region_list
### Title: Convert a (suitably filtered) data frame from
###   'list_census_regions' to a list suitable for passing to 'get_census'.
### Aliases: as_census_region_list

### ** Examples

## Not run: 
##D library(dplyr, warn.conflicts = FALSE)
##D 
##D # Query the CensusMapper API for the total occupied dwellings
##D # of 20 random Census Subdivisions, in Census 2016.
##D regions <- list_census_regions("CA16") %>%
##D   filter(level == "CSD") %>%
##D   sample_n(20) %>%
##D   as_census_region_list()
##D 
##D occupied <- get_census("CA16", regions = regions,
##D                             vectors = c("v_CA16_408"),
##D                             level = "Regions")
## End(Not run)



