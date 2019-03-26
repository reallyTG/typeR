library(GLDEX)


### Name: fun.theo.bi.mv.gld
### Title: Calculates the theoretical mean, variance, skewness and kurtosis
###   for mixture of two generalised lambda distributions.
### Aliases: fun.theo.bi.mv.gld
### Keywords: univar

### ** Examples

## Fits the Old Faithful geyser data (first column) using the maximum 
## likelihood.
# fit1<-fun.auto.bimodal.ml(faithful[,1],init1.sel="rmfmkl",init2.sel="rmfmkl",
# init1=c(-0.25,1.5),init2=c(-0.25,1.5),leap1=3,leap2=3)

## Find the theoretical moments of the fit
# fun.theo.bi.mv.gld(fit1$par[1],fit1$par[2],fit1$par[3],fit1$par[4],"fmkl",
# fit1$par[5],fit1$par[6],fit1$par[7],fit1$par[8],"fmkl",fit1$par[9])

## Compare this with the empirical moments from the data set.
# fun.moments(faithful[,1])



