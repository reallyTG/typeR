library(spocc)


### Name: as.bison
### Title: Coerce occurrence keys to bisonkey/occkey objects
### Aliases: as.bison

### ** Examples

## Not run: 
##D spnames <- c('Accipiter striatus', 'Setophaga caerulescens',
##D   'Spinus tristis')
##D out <- occ(query=spnames, from='bison', limit=2)
##D res <- occ2df(out)
##D (tt <- as.bison(out))
##D (uu <- as.bison(res))
##D as.bison(as.numeric(res$key[1]))
##D as.bison(res$key[1])
##D as.bison(as.list(res$key[1:2]))
##D as.bison(tt[[1]])
##D as.bison(uu[[1]])
##D as.bison(tt[1:2])
## End(Not run)



