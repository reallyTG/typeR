library(cancensus)


### Name: search_census_regions
### Title: Query the CensusMapper API for regions with names matching a
###   searchterm.
### Aliases: search_census_regions

### ** Examples

search_census_regions('Victoria', 'CA16')

## Not run: 
##D # This will return a warning that no match was found, but will suggest similar named regions.
##D search_census_regions('Victorea', 'CA16')
##D 
##D # This will limit region results to only include CMA level regions
##D search_census_regions('Victoria', 'CA16', level = "CMA")
## End(Not run)



