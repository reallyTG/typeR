library(bnormnlr)


### Name: bnormnlr-package
### Title: Bayesian Estimation for Normal Heteroscedastic Nonlinear
###   Regression Models
### Aliases: bnormnlr-package bnormnlr
### Keywords: package

### ** Examples

utils::data(muscle, package = "MASS")
###mean and variance functions
fmu<-function(param,cov){ param[1] + param[2]*exp(-cov/exp(param[3]))}
fsgma<-function(param,cov){drop(exp(cov%*%param))}

##Note: use more MCMC chains (i.e NC=10000) for more accurate results.
m1b<-bnlr(y=muscle$Length,f1=fmu,f2=fsgma,x=muscle$Conc,
z=cbind(1,muscle$Conc),bta0=c(20,-30,0),gma0=c(2,0),Nc=1200)
chainsum(m1b$chains,burn=1:200)
infocrit(m1b,1:8000)



