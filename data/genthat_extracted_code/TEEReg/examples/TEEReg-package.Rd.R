library(TEEReg)


### Name: TEEReg-package
### Title: Trimmed Elemental Estimation for Linear Models.
### Aliases: TEEReg-package TEEReg
### Keywords: TEEReg TEE.BCa TEE

### ** Examples

data(telephone)
fit <- TEE(formula=Y~X,data=telephone,p.trimmed=0.5,p.subsample=0.5,method="tee")
TEE.BCa(formula=Y~X,data=telephone,est.TEE=fit$coefficients,p.trimmed=0.5,p.subsample=0.5,
method="tee",conf.level=0.05,n.boot=20)



