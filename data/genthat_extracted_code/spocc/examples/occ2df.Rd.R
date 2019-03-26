library(spocc)


### Name: occ2df
### Title: Combine results from occ calls to a single data.frame
### Aliases: occ2df

### ** Examples

## Not run: 
##D # combine results from output of an occ() call
##D spnames <- c('Accipiter striatus', 'Setophaga caerulescens',
##D   'Spinus tristis')
##D out <- occ(query=spnames, from='gbif', gbifopts=list(hasCoordinate=TRUE),
##D   limit=10)
##D occ2df(out)
##D occ2df(out$gbif)
##D 
##D out <- occ(
##D   query='Accipiter striatus',
##D   from=c('gbif','bison','ecoengine','ebird','inat','vertnet'),
##D   gbifopts=list(hasCoordinate=TRUE), limit=2)
##D occ2df(out)
##D occ2df(out$vertnet)
##D 
##D # or combine many results from a single data source
##D spnames <- c('Accipiter striatus', 'Spinus tristis')
##D out <- occ(query=spnames, from='ecoengine', limit=2)
##D occ2df(out$ecoengine)
##D 
##D spnames <- c('Accipiter striatus', 'Spinus tristis')
##D out <- occ(query=spnames, from='gbif', limit=2)
##D occ2df(out$gbif)
## End(Not run)



