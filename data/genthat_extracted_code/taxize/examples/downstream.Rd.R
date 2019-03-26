library(taxize)


### Name: downstream
### Title: Retrieve the downstream taxa for a given taxon name or ID.
### Aliases: downstream downstream.default downstream.tsn downstream.colid
###   downstream.gbifid downstream.uid downstream.ids

### ** Examples

## Not run: 
##D # Plug in taxon IDs
##D downstream("015be25f6b061ba517f495394b80f108", db = "col",
##D   downto = "species")
##D 
##D # Plug in taxon names
##D downstream("Insecta", db = 'col', downto = 'order')
##D downstream("Apis", db = 'col', downto = 'species')
##D downstream("Apis", db = 'ncbi', downto = 'species')
##D downstream("Apis", db = 'itis', downto = 'species')
##D downstream(c("Apis","Epeoloides"), db = 'itis', downto = 'species')
##D downstream(c("Apis","Epeoloides"), db = 'col', downto = 'species')
##D downstream("Ursus", db = 'gbif', downto = 'species')
##D downstream(get_gbifid("Ursus"), db = 'gbif', downto = 'species')
##D 
##D # Plug in IDs
##D id <- get_colid("Apis")
##D downstream(id, downto = 'species')
##D 
##D ## Equivalently, plug in the call to get the id via e.g., get_colid
##D ## into downstream
##D identical(downstream(id, downto = 'species'),
##D          downstream(get_colid("Apis"), downto = 'species'))
##D 
##D id <- get_colid("Apis")
##D downstream(id, downto = 'species')
##D downstream(get_colid("Apis"), downto = 'species')
##D 
##D # Many taxa
##D sp <- names_list("genus", 3)
##D downstream(sp, db = 'col', downto = 'species')
##D downstream(sp, db = 'itis', downto = 'species')
##D downstream(sp, db = 'gbif', downto = 'species')
##D 
##D # Both data sources
##D ids <- get_ids("Apis", db = c('col','itis'))
##D downstream(ids, downto = 'species')
##D ## same result
##D downstream(get_ids("Apis", db = c('col','itis')), downto = 'species')
##D 
##D # Collect intermediate names
##D ## itis
##D downstream('Bangiophyceae', db="itis", downto="genus")
##D downstream('Bangiophyceae', db="itis", downto="genus", intermediate=TRUE)
##D downstream(get_tsn('Bangiophyceae'), downto="genus")
##D downstream(get_tsn('Bangiophyceae'), downto="genus", intermediate=TRUE)
##D ## col
##D downstream(get_colid("Animalia"), downto="class")
##D downstream(get_colid("Animalia"), downto="class", intermediate=TRUE)
##D 
##D # Use the rows parameter
##D ## note how in the second function call you don't get the prompt
##D downstream("Poa", db = 'col', downto="species")
##D downstream("Poa", db = 'col', downto="species", rows=1)
##D 
##D # use curl options
##D res <- downstream("Apis", db = 'col', downto = 'species', verbose = TRUE)
## End(Not run)



