library(TEEReg)


### Name: TEE
### Title: Compute the trimmed elemental estimates.
### Aliases: TEE
### Keywords: TEE TEEReg

### ** Examples

data(telephone)
fit<-TEE(formula=Y~X,data=telephone,p.trimmed=0.5,p.subsample=0.5,method="tee")



