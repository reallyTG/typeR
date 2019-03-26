library(MTS)


### Name: refVAR
### Title: Refining a VAR Model
### Aliases: refVAR

### ** Examples

data("mts-examples",package="MTS")
gdp=log(qgdp[,3:5])
zt=diffM(gdp)
m1=VAR(zt,3)
m2=refVAR(m1,thres=1.0)
names(m2)



