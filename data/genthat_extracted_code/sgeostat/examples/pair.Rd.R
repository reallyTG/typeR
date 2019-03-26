library(sgeostat)


### Name: pair
### Title: Pair Object
### Aliases: pair
### Keywords: spatial

### ** Examples

## Don't show: 
# prepare variables from other example pages if they are not already there:
if(length(ls(pat="maas.point"))==0){example(point)}
## End(Don't show)
maas.pair   <- pair(maas.point,num.lags=10,maxdist=2000)
maas.pair25 <- pair(maas.point,num.lags=10,type='anisotropic',
                      theta=25,maxdist=500)



