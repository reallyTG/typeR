library(gap)


### Name: pgc
### Title: Preparing weight for GENECOUNTING
### Aliases: pgc
### Keywords: utilities

### ** Examples

## Not run: 
##D 
##D data(hla)
##D x <- hla[,3:8]
##D 
##D # do not handle missing data
##D y<-pgc(x,handle.miss=0,with.id=1)
##D hla.gc<-genecounting(y$cdata,y$wt,handle.miss=0)
##D 
##D # handle missing but with multilocus genotype identifier
##D pgc(x,handle.miss=1,with.id=1)
##D 
##D # handle missing data with no identifier
##D pgc(x,handle.miss=1,with.id=0)
## End(Not run)



