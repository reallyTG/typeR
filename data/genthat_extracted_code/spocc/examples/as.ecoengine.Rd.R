library(spocc)


### Name: as.ecoengine
### Title: Coerce occurrence keys to ecoenginekey/occkey objects
### Aliases: as.ecoengine

### ** Examples

## Not run: 
##D spnames <- c('Accipiter striatus', 'Spinus tristis')
##D out <- occ(query=spnames, from='ecoengine', limit=2)
##D res <- occ2df(out)
##D (tt <- as.ecoengine(out))
##D (uu <- as.ecoengine(res))
##D as.ecoengine(res$key[1])
##D as.ecoengine(as.list(res$key[1:2]))
##D as.ecoengine(tt[[1]])
##D as.ecoengine(uu[[1]])
##D as.ecoengine(tt[1:2])
## End(Not run)



