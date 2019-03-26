library(covreg)


### Name: covreg.mcmc
### Title: Bayesian estimation of the covariance regressioin model
### Aliases: covreg.mcmc

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



