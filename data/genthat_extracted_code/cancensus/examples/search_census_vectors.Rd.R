library(cancensus)


### Name: search_census_vectors
### Title: Query the CensusMapper API for vectors with descriptions
###   matching a searchterm.
### Aliases: search_census_vectors

### ** Examples

search_census_vectors('Ojibway', 'CA16')
## Not run: 
##D # This will return a warning that no match was found, but will suggest similar terms.
##D search_census_vectors('Ojibwe', 'CA16', 'Total')
## End(Not run)



