library(geosptdb)


### Name: rbfST.cv1
### Title: RMSPE value result of leave-one-out cross validation for _rbfST_
### Aliases: rbfST.cv1
### Keywords: spatial

### ** Examples

require(minqa)
data(croatiadb)
coordinates(croatiadb) <- ~x+y

## Not run: 
##D rbf.im <- bobyqa(c(0.5, 0.5), rbfST.cv1, lower=c(1e-05,0), upper=c(2,2), 
##D               formula=MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, data=croatiadb, n.neigh=25, 
##D               func="IM", control=list(maxfun=50))         
## End(Not run)

# obtained with the optimal values previously estimated
rbfST.cv1(c(0.847050095690357,0.104157855356128), MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, 
           croatiadb, n.neigh=25, func="IM")



