library(spocc)


### Name: as.idigbio
### Title: Coerce occurrence keys to idigbio objects
### Aliases: as.idigbio

### ** Examples

## Not run: 
##D spnames <- c('Accipiter striatus', 'Setophaga caerulescens',
##D   'Spinus tristis')
##D out <- occ(query=spnames, from='idigbio', limit=2)
##D res <- occ2df(out)
##D (tt <- as.idigbio(out))
##D (uu <- as.idigbio(res))
##D as.idigbio(res$key[1])
##D as.idigbio(as.list(res$key[1:2]))
##D as.idigbio(tt[[1]])
##D as.idigbio(uu[[1]])
##D as.idigbio(tt[1:2])
##D 
##D library("dplyr")
##D bind_rows(lapply(tt, function(x) data.frame(unclass(x)$data)))
## End(Not run)



