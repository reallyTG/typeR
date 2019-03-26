library(HydroMe)


### Name: HydroMe2-package
### Title: R codes for estimating water retention and infiltration model
###   parameters using experimental data
### Aliases: HydroMe2-package HydroMe2
### Keywords: package

### ** Examples

data(infilt)
gamp.ns=nlsLM(Rate~SSgampt(Time,ks,A), infilt)
summary(gamp.ns)
data(isric)
isric1=isric[1:32,]
omuto=nlsList(y~SSomuto(x,ths1,alp1,ths2,alp2)|Sample, isric1)
omuto.nlme=nlme(omuto)## for fitting mixed-effects models
summary(omuto.nlme)




