library(implyr)


### Name: dbGetQuery,src_impala,character-method
### Title: Send SQL query to Impala and retrieve results
### Aliases: dbGetQuery,src_impala,character-method

### ** Examples

## Not run: 
##D flights_by_carrier_df <- dbGetQuery(
##D   impala,
##D   "SELECT carrier, COUNT(*) FROM flights GROUP BY carrier"
##D )
## End(Not run)



