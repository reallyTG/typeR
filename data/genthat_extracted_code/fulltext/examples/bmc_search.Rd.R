library(fulltext)


### Name: bmc_search
### Title: Search for gene sequences available for a species from NCBI.
### Aliases: bmc_search
### Keywords: internal

### ** Examples

## Not run: 
##D bmc_search(query='ecology')
##D bmc_search('fire', limit=3)
##D bmc_search('fire', limit=2, page=1)
##D bmc_search('fire', limit=2, page=2)
##D 
##D # Search, then get full text
##D out <- bmc_search('ecology')
##D (urls <- vapply(out$records$url, "[[", "", 'value'))
##D browseURL(urls[1])
##D 
##D # curl debugging help
##D bmc_search('ecology', verbose = TRUE)
## End(Not run)



