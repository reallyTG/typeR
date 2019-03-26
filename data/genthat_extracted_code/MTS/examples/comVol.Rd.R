library(MTS)


### Name: comVol
### Title: Common Volatility
### Aliases: comVol

### ** Examples

data("mts-examples",package="MTS")
zt=diffM(log(qgdp[,3:5]))
m1=comVol(zt,p=2)
names(m1)



