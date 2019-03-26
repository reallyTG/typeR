library(MTS)


### Name: VARpred
### Title: VAR Prediction
### Aliases: VARpred

### ** Examples

data("mts-examples",package="MTS")
gdp=log(qgdp[,3:5])
zt=diffM(gdp)
m1=VAR(zt,p=2)
VARpred(m1,4)



