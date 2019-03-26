library(MTS)


### Name: VARs
### Title: VAR Model with Selected Lags
### Aliases: VARs

### ** Examples

data("mts-examples",package="MTS")
zt=log(qgdp[,3:5])
m1=VARs(zt,lags=c(1,2,4))



