library(geospt)


### Name: rbf.tcv
### Title: table of rbf cross validation, leave-one-out
### Aliases: rbf.tcv
### Keywords: spatial

### ** Examples

data(preci)
coordinates(preci)<-~x+y
rbf.tcv(prec~x+y, preci, eta=0.1460814, rho=0, n.neigh=9, func="TPS")



