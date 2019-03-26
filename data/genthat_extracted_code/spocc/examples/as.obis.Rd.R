library(spocc)


### Name: as.obis
### Title: Coerce occurrence keys to obis id objects
### Aliases: as.obis

### ** Examples

## Not run: 
##D spnames <- c('Mola mola', 'Loligo vulgaris', 'Stomias boa')
##D out <- occ(query=spnames, from='obis', limit=2)
##D (res <- occ2df(out))
##D (tt <- as.obis(out))
##D (uu <- as.obis(res))
##D as.obis(x = res$key[1])
##D as.obis(as.list(res$key[1:2]))
##D as.obis(tt[[1]])
##D as.obis(uu[[1]])
##D as.obis(tt[1:2])
##D 
##D library("data.table")
##D rbindlist(tt, use.names = TRUE, fill = TRUE)
## End(Not run)



