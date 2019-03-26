library(TEEReg)


### Name: TEE.BCa
### Title: Compute the bias-corrected accelerated bootstrap confidence
###   intervals.
### Aliases: TEE.BCa
### Keywords: TEE.BCa TEEReg TEE

### ** Examples

data(telephone)
fit <- TEE(formula=Y~X,data=telephone,p.trimmed=0.5,p.subsample=0.5,method="tee")
TEE.BCa(formula=Y~X,data=telephone,est.TEE=fit$coefficients,p.trimmed=0.5,p.subsample=0.5,
method="tee",conf.level=0.05,n.boot=20)



