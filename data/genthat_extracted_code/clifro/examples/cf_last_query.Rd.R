library(clifro)


### Name: cf_last_query
### Title: Retrieve Last Query Result from CliFlo
### Aliases: cf_last_query

### ** Examples

## Not run: 
##D # Query CliFlo for wind at Reefton Ews
##D cf_query(cf_user(), cf_datatype(2, 1, 1, 1), cf_station(), "2012-01-01 00")
##D 
##D # Oops! Forgot to assign it to a variable...
##D reefton.wind = cf_last_query()
##D reefton.wind
## End(Not run)



