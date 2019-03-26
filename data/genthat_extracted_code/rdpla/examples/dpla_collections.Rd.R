library(rdpla)


### Name: dpla_collections
### Title: Search collections from the Digital Public Library of America
###   (DPLA).
### Aliases: dpla_collections

### ** Examples

## Not run: 
##D dpla_collections(q="university of texas", page_size=2)
##D dpla_collections(q="university of texas", fields='id', page_size=2)
##D dpla_collections(q="university of texas", sort_by='title', page_size=5)
##D dpla_collections(title="paso")
##D dpla_collections(description="east")
##D 
##D # use curl options
##D dpla_collections(q="university", verbose = TRUE)
## End(Not run)



