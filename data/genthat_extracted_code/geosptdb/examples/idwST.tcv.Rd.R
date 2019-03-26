library(geosptdb)


### Name: idwST.tcv
### Title: table of idw spatio-temporal leave-one-out cross validation
### Aliases: idwST.tcv
### Keywords: spatial

### ** Examples

## Not run: 
##D data(croatiadb)
##D coordinates(croatiadb) <- ~x+y
##D idw.t <- idwST.tcv(MTEMP~1, croatiadb, n.neigh=10, C=1.0054, factor.p=1.9585)
##D criterioST.cv(idw.t)
## End(Not run)



