library(Rnumerai)


### Name: run_query
### Title: Function to run a raw GraphQL query on the API interface
### Aliases: run_query

### ** Examples

## Not run: 
##D ## Run Custom GraphQL code from R
##D custom_query <- "query queryname {
##D rounds (number:82) {
##D closeTime
##D }
##D }"
##D run_query(query=custom_query)$data
## End(Not run)



