library(taxize)


### Name: col_search
### Title: Search Catalogue of Life for taxonomic IDs
### Aliases: col_search

### ** Examples

## Not run: 
##D # A basic example
##D col_search(name="Apis")
##D col_search(name="Agapostemon")
##D col_search(name="Poa")
##D 
##D # Get full response, i.e., more data
##D col_search(name="Apis", response="full")
##D col_search(name="Poa", response="full")
##D 
##D # Many names
##D col_search(name=c("Apis","Puma concolor"))
##D col_search(name=c("Apis","Puma concolor"), response = "full")
##D 
##D # An example where there is no data
##D col_search(id = "36c623ad9e3da39c2e978fa3576ad415")
##D col_search(id = "36c623ad9e3da39c2e978fa3576ad415", response = "full")
##D col_search(id = "787ce23969f5188c2467126d9a545be1")
##D col_search(id = "787ce23969f5188c2467126d9a545be1", response = "full")
##D col_search(id = c("36c623ad9e3da39c2e978fa3576ad415", 
##D   "787ce23969f5188c2467126d9a545be1"))
##D ## a synonym
##D col_search(id = "f726bdaa5924cabf8581f99889de51fc")
##D col_search(id = "f726bdaa5924cabf8581f99889de51fc", response = "full")
## End(Not run)



