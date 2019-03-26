library(covreg)


### Name: covreg-package
### Title: A simultaneous regression model for the mean and covariance
### Aliases: covreg-package
### Keywords: package

### ** Examples

## load FEV data ##
data(fev)
## specify mean and cov models ##
library(splines)
fmean=as.formula(cbind(fev,height)~bs(age,knots=11))
fcov=as.formula(cbind(fev,height)~sqrt(age)+age)
## fit model ##
fit<-covreg.mcmc(fmean,fcov,data=fev,R=2,niter=100,nthin=1)
## summarize MCMC samples ##
M.psamp=m.psamp(fit)
S.psamp=cov.psamp(fit)



