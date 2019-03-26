library(spocc)


### Name: as.vertnet
### Title: Coerce occurrence keys to vertnetkey/occkey objects
### Aliases: as.vertnet

### ** Examples

## Not run: 
##D spnames <- c('Accipiter striatus', 'Setophaga caerulescens',
##D   'Spinus tristis')
##D out <- occ(query=spnames, from='vertnet', has_coords=TRUE, limit=2)
##D res <- occ2df(out)
##D (tt <- as.vertnet(out))
##D (uu <- as.vertnet(res))
##D keys <- Filter(Negate(is.na), res$key)
##D as.vertnet(keys[1])
##D as.vertnet(as.list(keys[1:2]))
##D as.vertnet(tt[[1]])
##D as.vertnet(uu[[1]])
##D as.vertnet(tt[1:2])
## End(Not run)



