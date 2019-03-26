library(spocc)


### Name: as.inat
### Title: Coerce occurrence keys to iNaturalist id objects
### Aliases: as.inat

### ** Examples

## Not run: 
##D spnames <- c('Accipiter striatus', 'Setophaga caerulescens',
##D   'Spinus tristis')
##D out <- occ(query=spnames, from='inat', limit=2)
##D res <- occ2df(out)
##D (tt <- as.inat(out))
##D (uu <- as.inat(res))
##D as.inat(res$key[1])
##D as.inat(as.list(res$key[1:2]))
##D as.inat(tt[[1]])
##D as.inat(uu[[1]])
##D as.inat(tt[1:2])
##D 
##D library("dplyr")
##D bind_rows(lapply(tt, function(x) {
##D   data.frame(x$taxon[c('id','name','rank','unique_name')],
##D              stringsAsFactors = FALSE)
##D }))
## End(Not run)



