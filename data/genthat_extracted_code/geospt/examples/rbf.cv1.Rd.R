library(geospt)


### Name: rbf.cv1
### Title: Generates a RMSPE value, result of cross validation
###   leave-one-out
### Aliases: rbf.cv1
### Keywords: spatial

### ** Examples

## Not run: 
##D data(preci)
##D coordinates(preci) <- ~x+y
##D bobyqa(c(0.5, 0.5), rbf.cv1, lower=c(1e-05,0), upper=c(2,2), formula=prec~x+y, data=preci,
##D     n.neigh=9, func="TRI")
##D # obtained with the optimal values previously estimated
##D rbf.cv1(c(0.2126191,0.1454171), prec~x+y, preci, n.neigh=9, func="TRI")  
## End(Not run)



