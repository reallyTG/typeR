library(geosptdb)


### Name: rbfST.tcv
### Title: table of rbf spatio-temporal cross validation, leave-one-out
### Aliases: rbfST.tcv
### Keywords: spatial

### ** Examples

data(croatiadb)
coordinates(croatiadb) <- ~x+y
rbfST.tcv(MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, croatiadb, eta=0.0108, rho=0.00004, 
          n.neigh=30, func="TPS")



