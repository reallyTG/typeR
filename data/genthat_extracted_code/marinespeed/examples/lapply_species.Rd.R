library(marinespeed)


### Name: lapply_species
### Title: Apply a function over a set of species
### Aliases: lapply_species

### ** Examples

## Not run: 
##D get_occ_count <- function(speciesname, occ) {
##D  nrow(occ)
##D }
##D 
##D record_counts <- lapply_species(get_occ_count)
##D sum(unlist(record_counts))
##D 
##D # count first 10
##D species <- list_species()
##D lapply_species(get_occ_count, species=species[1:10,])
## End(Not run)



