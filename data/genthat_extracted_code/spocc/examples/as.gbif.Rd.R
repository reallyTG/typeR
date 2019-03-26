library(spocc)


### Name: as.gbif
### Title: Coerce occurrence keys to gbifkey/occkey objects
### Aliases: as.gbif

### ** Examples

## Not run: 
##D spnames <- c('Accipiter striatus', 'Setophaga caerulescens', 
##D   'Spinus tristis')
##D out <- occ(query=spnames, from=c('gbif','ebird'), 
##D   gbifopts=list(hasCoordinate=TRUE), limit=2)
##D res <- occ2df(out)
##D (tt <- as.gbif(out))
##D (uu <- as.gbif(res))
##D as.gbif(as.numeric(res$key[1]))
##D as.gbif(res$key[1])
##D as.gbif(as.list(res$key[1:2]))
##D as.gbif(tt[[1]])
##D as.gbif(uu[[1]])
##D as.gbif(tt[1:2])
## End(Not run)



