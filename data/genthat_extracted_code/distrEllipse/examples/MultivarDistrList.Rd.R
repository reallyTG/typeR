library(distrEllipse)


### Name: MultivarDistrList
### Title: Generating function for MultivarDistrList-class
### Aliases: MultivarDistrList
### Keywords: list distribution

### ** Examples

(DL1 <- MultivarDistrList(Norm(), Exp(), Pois()))
(DL2 <- MultivarDistrList(MVNorm(),
                          EllipticalDistribution(radDistr=Exp(), loc=c(1,2),
                          scale=diag(c(3,1))),MVt()))



