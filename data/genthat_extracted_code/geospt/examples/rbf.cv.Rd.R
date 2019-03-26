library(geospt)


### Name: rbf.cv
### Title: rbf cross validation leave-one-out
### Aliases: rbf.cv
### Keywords: spatial

### ** Examples

data(preci)
coordinates(preci)<-~x+y
rbf.cv(prec~1, preci, eta=0.2589, rho=0, n.neigh=9, func="M") 



