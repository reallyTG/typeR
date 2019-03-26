library(blscrapeR)


### Name: get_bls_county
### Title: A function that returns county-level labor statistics
### Aliases: get_bls_county

### ** Examples

## Not run: 
##D # Most recent month in the data set.
##D get_bls_county()
##D 
##D # A specific month
##D df <- get_bls_county("May 2017")
##D 
##D # Multiple months
##D df <- get_bls_county(c("April 2017","May 2017"))
##D 
##D # A specific state
##D df <- get_bls_county(stateName = "Florida")
##D 
##D # Multiple states, multiple months
##D df<- get_bls_county(date_mth = "April 2017", 
##D              stateName = c("Florida", "Alabama"))
## End(Not run)




