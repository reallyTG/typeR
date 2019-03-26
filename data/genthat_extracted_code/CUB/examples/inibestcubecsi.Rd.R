library(CUB)


### Name: inibestcubecsi
### Title: Preliminary estimates of parameters for CUBE models with
###   covariates only for feeling
### Aliases: inibestcubecsi
### Keywords: htest utilities

### ** Examples

data(relgoods)
isnacov<-which(is.na(relgoods$Gender))
isnaord<-which(is.na(relgoods$Tv))
na<-union(isnacov,isnaord)
ordinal<-relgoods$Tv[-na]; W<-relgoods$Gender[-na]
m<-10
starting<-rep(0.1,3)
ini<-inibestcubecsi(m,ordinal,W,starting,maxiter=100,toler=1e-3)
nparam<-length(ini)
pai<-ini[1]                 # Preliminary estimates for uncertainty component
gamaest<-ini[2:(nparam-1)]  # Preliminary estimates for coefficients of feeling covariates
phi<-ini[nparam]            # Preliminary estimates for overdispersion component



