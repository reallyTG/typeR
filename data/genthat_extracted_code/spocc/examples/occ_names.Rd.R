library(spocc)


### Name: occ_names
### Title: Search for species names across many data sources.
### Aliases: occ_names

### ** Examples

## Not run: 
##D # Single data sources
##D ## gbif
##D (res <- occ_names(query = 'Accipiter striatus', from = 'gbif'))
##D head(res$gbif$data[[1]])
##D 
##D ## bison
##D (res <- occ_names(query = '*bear', from = 'bison'))
##D res$bison$data
##D 
##D ## ecoengine
##D (res <- occ_names(query = 'genus:Lynx', from = 'ecoengine'))
##D head(res$ecoengine$data[[1]])
## End(Not run)



