library(mpt)


### Name: logLik.mpt
### Title: Log-Likelihood of an mpt Object
### Aliases: logLik.mpt nobs.mpt deviance.mpt
### Keywords: models

### ** Examples

mpt1 <- mpt(mptspec("SR2"), c(243, 64, 58, 55)) # from Riefer et al. (2002)
logLik(mpt1)
AIC(mpt1)
BIC(mpt1)
deviance(mpt1)
nobs(mpt1)



