library(MTS)


### Name: VAR
### Title: Vector Autoregressive Model
### Aliases: VAR

### ** Examples

data("mts-examples",package="MTS")
gdp=log(qgdp[,3:5])
zt=diffM(gdp)
m1=VAR(zt,p=2)



