library(taxize)


### Name: children
### Title: Retrieve immediate children taxa for a given taxon name or ID.
### Aliases: children children.default children.tsn children.colid
###   children.wormsid children.ids children.uid

### ** Examples

## Not run: 
##D # Plug in taxonomic IDs
##D children(161994, db = "itis")
##D children(8028, db = "ncbi")
##D children("578cbfd2674a9b589f19af71a33b89b6", db = "col")
##D ## works with numeric if as character as well
##D children("161994", db = "itis")
##D 
##D # Plug in taxon names
##D children("Salmo", db = 'col')
##D children("Salmo", db = 'itis')
##D children("Salmo", db = 'ncbi')
##D children("Salmo", db = 'worms')
##D 
##D # Plug in IDs
##D (id <- get_colid("Apis"))
##D children(id)
##D 
##D (id <- get_wormsid("Platanista"))
##D children(id)
##D 
##D ## Equivalently, plug in the call to get the id via e.g., get_colid
##D ## into children
##D (id <- get_colid("Apis"))
##D children(id)
##D children(get_colid("Apis"))
##D 
##D # Many taxa
##D sp <- c("Tragia", "Schistocarpha", "Encalypta")
##D children(sp, db = 'col')
##D children(sp, db = 'itis')
##D 
##D # Two data sources
##D (ids <- get_ids("Apis", db = c('col','itis')))
##D children(ids)
##D ## same result
##D children(get_ids("Apis", db = c('col','itis')))
##D 
##D # Use the rows parameter
##D children("Poa", db = 'col')
##D children("Poa", db = 'col', rows=1)
##D 
##D # use curl options
##D res <- children("Poa", db = 'col', rows=1, verbose = TRUE)
## End(Not run)



