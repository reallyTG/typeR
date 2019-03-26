library(rif)


### Name: federation_search
### Title: Federation search
### Aliases: federation_search

### ** Examples

## Not run: 
##D out <- federation_search("cellular")
##D out$query
##D out$messages
##D out$result$total
##D out$result$categories
##D head(out$result$results)
##D 
##D head( federation_search("cellular")$result$results )
##D head( federation_search("cellular", strict=TRUE)$result$results )
##D federation_search("cellular", snippetCount=3)
##D 
##D federation_search("cellular", verbose = TRUE)
## End(Not run)



