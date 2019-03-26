library(sgeostat)


### Name: est.variogram
### Title: Variogram Estimator
### Aliases: est.variogram
### Keywords: spatial

### ** Examples

## Don't show: 
# prepare variables from other example pages if they are not already there:
if(length(ls(pat="maas.pair"))==0){example(pair)}
## End(Don't show)
maas.v<-est.variogram(maas.point,maas.pair,'zinc') 



