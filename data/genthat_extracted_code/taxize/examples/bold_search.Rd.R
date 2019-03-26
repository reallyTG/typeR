library(taxize)


### Name: bold_search
### Title: Search Barcode of Life for taxonomic IDs
### Aliases: bold_search

### ** Examples

## Not run: 
##D # A basic example
##D bold_search(name="Apis")
##D bold_search(name="Agapostemon")
##D bold_search(name="Poa")
##D 
##D # Fuzzy search
##D head(bold_search(name="Po", fuzzy=TRUE))
##D head(bold_search(name="Aga", fuzzy=TRUE))
##D 
##D # Many names
##D bold_search(name=c("Apis","Puma concolor"))
##D nms <- names_list('species')
##D bold_search(name=nms)
##D 
##D # Searching by ID - dataTypes can be used, and includeTree can be used
##D bold_search(id=88899)
##D bold_search(id=88899, dataTypes="stats")
##D bold_search(id=88899, dataTypes="geo")
##D bold_search(id=88899, dataTypes="basic")
##D bold_search(id=88899, includeTree=TRUE)
## End(Not run)



