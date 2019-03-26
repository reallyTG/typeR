library(geospt)


### Name: est.variograms
### Title: Variogram Estimator
### Aliases: est.variograms
### Keywords: spatial

### ** Examples

library(sgeostat, pos=which(search()=="package:gstat")+1)
data(maas)
maas.point <- point(maas) 
maas.pair <- pair(maas.point, num.lags=24, maxdist=2000) 
maas.v <- est.variograms(maas.point,maas.pair,'zinc',trim=0.1) 
maas.v



