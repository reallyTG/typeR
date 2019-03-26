library(GLDEX)


### Name: fun.moments.bimodal
### Title: Finds the moments of fitted mixture of generalised lambda
###   distribution by simulation.
### Aliases: fun.moments.bimodal
### Keywords: univar

### ** Examples

## Fitting the first column of the Old Faithful Geyser data
# fit1<-fun.auto.bimodal.ml(faithful[,1],init1.sel="rmfmkl",init2.sel="rmfmkl",
# init1=c(-0.25,1.5),init2=c(-0.25,1.5),leap1=3,leap2=3)

## After fitting compute the monte carlo moments using fun.moments.bimodal
# fun.moments.bimodal(fit1$par[1:4],fit1$par[5:8],prop1=fit1$par[9],
# param1="fmkl",param2="fmkl")

## It is also possible to compare this with the moments of the original dataset:
# fun.moments(faithful[,1])



