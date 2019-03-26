library(rvertnet)


### Name: bigsearch
### Title: Request to download a large number of VertNet records.
### Aliases: bigsearch

### ** Examples

## Not run: 
##D # replace "big@search.luv" with your own email address
##D bigsearch(genus = "ochotona", rf = "pikaRecords", email = "big@search.luv")
##D 
##D # Pass in curl options for curl debugging
##D bigsearch(genus = "ochotona", rfile = "pikaRecords",
##D   email = "big@search.luv", verbose = TRUE)
##D 
##D # Use more than one year query
##D bigsearch(class = "aves", year = c(">=1976", "<=1986"),
##D           rfile = "test-bigsearch1", email = "big@search.luv")
## End(Not run)



