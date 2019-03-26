library(distrEllipse)


### Name: MultivarDistrList-class
### Title: List of multivariate distributions
### Aliases: MultivarDistrList-class MVDistrList-class
###   coerce,MultivariateDistribution,MultivarDistrList-method
###   dim,MultivarDistrList-method dimension,MultivarDistrList-method
### Keywords: distribution list

### ** Examples

(DL1 <- MultivarDistrList(Norm(), Exp(), Pois()))
(DL2 <- MultivarDistrList(MVNorm(),
                          EllipticalDistribution(radDistr=Exp(), loc=c(1,2),
                          scale=diag(c(3,1))),MVt()))



