library(geosptdb)


### Name: criterioST.cv
### Title: Cross-validation summaries
### Aliases: criterioST.cv
### Keywords: spatial

### ** Examples

# leave-one-out cross validation: 
data(croatiadb)
coordinates(croatiadb) <- ~x+y

# inverse multiquadratic function, predefined eta and rho
tempm <- rbfST.tcv(MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, croatiadb, eta=0.0108, 
                   rho=0.00004, n.neigh=25, func="IM")
criterioST.cv(tempm)



