library(rphylopic)


### Name: nameset
### Title: Perform actions with name sets
### Aliases: nameset nameset_get nameset_taxonomy

### ** Examples

## Not run: 
##D # Retrieves information on a set of taxonomic names.
##D id <- "8d9a9ea3-95cc-414d-1000-4b683ce04be2"
##D nameset_get(uuid = id)
##D nameset_get(uuid = id, options=c('names','string'))
##D 
##D # Collects taxonomic data for a name.
##D nameset_taxonomy(uuid = "8d9a9ea3-95cc-414d-1000-4b683ce04be2", 
##D   options = "string")
##D nameset_taxonomy(uuid = "8d9a9ea3-95cc-414d-1000-4b683ce04be2", 
##D   supertaxa="immediate", options=c("string","namebankID"))
## End(Not run)



