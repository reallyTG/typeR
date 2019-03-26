library(totalcensus)


### Name: search_fips
### Title: Search FIPS Codes
### Aliases: search_fips

### ** Examples

# Change view = TRUE (default) to View the returned data.table.

# Search fips of Lincoln in Rhode Island.
aaa <- search_fips("lincoln", "RI", view = FALSE)

# search FIPS number in all states
bbb <- search_fips("08375", view = FALSE)

## Not run: 
##D   # view all fips code
##D   search_fips()
## End(Not run)




