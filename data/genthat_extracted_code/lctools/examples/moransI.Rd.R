library(lctools)


### Name: moransI
### Title: Moran's I classic statistic for assessing spatial
###   autocorrelation
### Aliases: moransI
### Keywords: Moran's I Moran's I significance test Spatial autocorrelation

### ** Examples

data(GR.Municipalities)
attr<-GR.Municipalities@data
m.I<-moransI(cbind(attr$X, attr$Y),6,attr$UnemrT01)

t(as.matrix(m.I[2:7]))




