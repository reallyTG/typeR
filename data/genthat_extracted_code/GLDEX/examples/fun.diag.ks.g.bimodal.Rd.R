library(GLDEX)


### Name: fun.diag.ks.g.bimodal
### Title: Compute the simulated Kolmogorov-Smirnov tests for the bimodal
###   dataset
### Aliases: fun.diag.ks.g.bimodal
### Keywords: htest

### ** Examples

## Fit the faithful[,1] data from the MASS library
# fit1<-fun.auto.bimodal.ml(faithful[,1],init1.sel="rprs",init2.sel="rmfmkl",
# init1=c(-1.5,1,5),init2=c(-0.25,1.5),leap1=3,leap2=3)
## Run diagnostic KS tests
# fun.diag.ks.g.bimodal(fit1$par[1:4],fit1$par[5:8],prop1=fit1$par[9],
# data=faithful[,1],param1="rs",param2="fmkl")



