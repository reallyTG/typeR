library(spocc)


### Name: as.ala
### Title: Coerce occurrence keys to ALA id objects
### Aliases: as.ala

### ** Examples

## Not run: 
##D spnames <- c('Barnardius zonarius', 'Grus rubicunda', 'Cracticus tibicen')
##D out <- occ(query=spnames, from='ala', limit=2)
##D (res <- occ2df(out))
##D (tt <- as.ala(out))
##D as.ala(x = res$key[1])
## End(Not run)



