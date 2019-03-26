library(walmartAPI)


### Name: lookup
### Title: Looks up product information
### Aliases: lookup

### ** Examples

## Not run: 
##D key <- "************************"
##D 
##D ## Up to 20 ids can be called at once.
##D lookup(id = c(12417882:12417937), key = key)
##D 
##D lookup(id = 12417832, key = key)
##D 
##D lookup(upc = 10001137891, key = key)
##D 
##D ## First argument will be used with conflicting arguments.
##D lookup(id = 12417837, upc = 10001137891, key = key)
##D 
##D lookup(id = 12417832, key = key, list_output = TRUE)
## End(Not run)



