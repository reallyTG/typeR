library(lctools)


### Name: moransI.w
### Title: Moran's I classic statistic for assessing spatial
###   autocorrelation using a ready made weights matrix.
### Aliases: moransI.w
### Keywords: Moran's I Moran's I significance test Spatial autocorrelation

### ** Examples

data(GR.Municipalities)
attr <- GR.Municipalities@data

#using an adaptive kernel
w.ad <- w.matrix(cbind(attr$X, attr$Y),6)
mI.ad <- moransI.w(attr$UnemrT01,w.ad)
as.data.frame(mI.ad)


#using a fixed kernel
w.fixed<-w.matrix(cbind(attr$X, attr$Y), 50000, WType='Binary', family='fixed')
mI.fixed<-moransI.w(attr$UnemrT01,w.fixed)
as.data.frame(mI.fixed)



