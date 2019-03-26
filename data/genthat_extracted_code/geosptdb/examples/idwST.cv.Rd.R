library(geosptdb)


### Name: idwST.cv
### Title: IDW spatio-temporal leave-one-out cross validation
### Aliases: idwST.cv
### Keywords: spatial

### ** Examples

## Not run: 
##D data(croatiadb)
##D coordinates(croatiadb) <- ~x+y
##D idwST.cv(MTEMP~1, croatiadb[,1:2], n.neigh=10, C=1, factor.p=2)
## End(Not run)



