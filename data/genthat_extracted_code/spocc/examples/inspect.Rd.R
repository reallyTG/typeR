library(spocc)


### Name: inspect
### Title: Get more data on individual occurrences
### Aliases: inspect inspect.data.frame inspect.occdat inspect.occkey

### ** Examples

## Not run: 
##D spnames <- c('Accipiter striatus', 'Spinus tristis')
##D out <- occ(query=spnames, from=c('gbif','bison','ecoengine'),
##D    gbifopts=list(hasCoordinate=TRUE), limit=2)
##D res <- occ2df(out)
##D inspect(res)
##D 
##D out <- occ(query=spnames, from='gbif', gbifopts=list(hasCoordinate=TRUE),
##D   limit=4)
##D res <- occ2df(out)
##D inspect(res)
##D 
##D # from occkeys
##D key <- as.gbif(res$key[1])
##D inspect(key)
##D 
##D # idigbio
##D spnames <- c('Accipiter striatus', 'Spinus tristis')
##D out <- occ(query=spnames, from='idigbio', limit=20)
##D inspect(out)
## End(Not run)



