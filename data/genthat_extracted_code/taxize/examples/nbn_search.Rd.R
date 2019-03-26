library(taxize)


### Name: nbn_search
### Title: Search UK National Biodiversity Network
### Aliases: nbn_search

### ** Examples

## Not run: 
##D x <- nbn_search(q = "Vulpes")
##D x$meta$totalRecords
##D x$meta$pageSize
##D x$meta$urlParameters
##D x$meta$queryTitle
##D head(x$data)
##D 
##D nbn_search(q = "blackbird", start = 4)
##D 
##D # debug curl stuff
##D nbn_search(q = "blackbird", verbose = TRUE)
## End(Not run)



