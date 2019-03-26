library(geosptdb)


### Name: idwST.cv1
### Title: Generate a RMSPE value, result of leave-one-out cross validation
### Aliases: idwST.cv1
### Keywords: spatial

### ** Examples

require(minqa)
data(croatiadb)
coordinates(croatiadb) <- ~x+y

## Not run: 
##D idwST.opt <- bobyqa(c(1, 2), idwST.cv1, lower=c(0,0.1), upper=c(2,4), formula=MTEMP~1, 
##D                     data=croatiadb[,1:2], n.neigh=10, progres=F, control=list(maxfun=50))         
##D 
##D # obtained with optimal values previously estimated (33 iterations)
##D idwST.cv1(c(1.00538675066736,1.95853920335545), MTEMP~1, data=croatiadb[,1:2], n.neigh=10, 
##D           progress=T)
## End(Not run)



