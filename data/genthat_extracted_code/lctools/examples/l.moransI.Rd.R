library(lctools)


### Name: l.moransI
### Title: Local Moran's I classic statistic for assessing spatial
###   autocorrelation
### Aliases: l.moransI
### Keywords: local Moran's I Moran's I Clusters LISA

### ** Examples

data(GR.Municipalities)
l.moran<-l.moransI(cbind(GR.Municipalities$X, GR.Municipalities$Y),6,GR.Municipalities$Income01)



