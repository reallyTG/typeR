library(taxize)


### Name: get_ids
### Title: Retrieve taxonomic identifiers for a given taxon name.
### Aliases: get_ids get_ids_

### ** Examples

## Not run: 
##D # Plug in taxon names directly
##D ## By default you get ids for all data sources
##D get_ids(names="Chironomus riparius")
##D 
##D # specify rows to limit choices available
##D get_ids(names="Poa annua", db=c("col","eol"), rows=1)
##D get_ids(names="Poa annua", db=c("col","eol"), rows=1:2)
##D 
##D ## Or you can specify which source you want via the db parameter
##D get_ids(names="Chironomus riparius", db = 'ncbi')
##D get_ids(names="Salvelinus fontinalis", db = 'nbn')
##D 
##D get_ids(names=c("Chironomus riparius", "Pinus contorta"), db = 'ncbi')
##D get_ids(names=c("Chironomus riparius", "Pinus contorta"), db = c('ncbi','itis'))
##D get_ids(names=c("Chironomus riparius", "Pinus contorta"), db = c('ncbi','itis','col'))
##D get_ids(names="Pinus contorta", db = c('ncbi','itis','col','eol','tropicos'))
##D get_ids(names="ava avvva", db = c('ncbi','itis','col','eol','tropicos'))
##D 
##D # Pass on to other functions
##D out <- get_ids(names="Pinus contorta", db = c('ncbi','itis','col','eol','tropicos'))
##D classification(out$itis)
##D synonyms(out$tropicos)
##D 
##D # Get all data back
##D get_ids_(c("Chironomus riparius", "Pinus contorta"), db = 'nbn', rows=1:10)
##D get_ids_(c("Chironomus riparius", "Pinus contorta"), db = c('nbn','gbif'), rows=1:10)
##D 
##D # use curl options
##D get_ids("Agapostemon", db = "ncbi", verbose = TRUE)
## End(Not run)



