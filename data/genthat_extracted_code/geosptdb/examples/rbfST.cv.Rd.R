library(geosptdb)


### Name: rbfST.cv
### Title: Leave-one-out cross validation for spatio-temporal radial basis
###   function
### Aliases: rbfST.cv
### Keywords: spatial

### ** Examples

data(croatiadb)
coordinates(croatiadb) <- ~x+y
rbfST.cv(MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, croatiadb, eta=0.0108, rho=0.00004, 
          n.neigh=25, func="TPS")



