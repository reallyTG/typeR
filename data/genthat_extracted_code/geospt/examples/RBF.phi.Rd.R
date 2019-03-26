library(geospt)


### Name: RBF.phi
### Title: radial basis function evaluation
### Aliases: RBF.phi
### Keywords: spatial

### ** Examples

data(preci) 
d1 <- dist(rbind(preci[1,],preci[2,])) 
RBF.phi(distance=d1, eta=0.5, func="TPS")



