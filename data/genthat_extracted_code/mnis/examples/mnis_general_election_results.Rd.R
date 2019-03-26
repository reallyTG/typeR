library(mnis)


### Name: mnis_general_election_results
### Title: Returns an object containing list with details of the search
###   parameter and a tibble with election results. Accepts queries on
###   location type and name, and the start and end date to return general
###   elections between. The API does not contain data for Norther Ireland.
### Aliases: mnis_general_election_results
### Keywords: mnis

### ** Examples

## Not run: 
##D x <- mnis_general_election_results(location_type = 'Country', location_name = 'England',
##D                                  start_date = '2010-01-01', end_date = '2016-01-01')
## End(Not run)



