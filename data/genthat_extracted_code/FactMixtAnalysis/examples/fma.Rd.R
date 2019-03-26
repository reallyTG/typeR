library(FactMixtAnalysis)


### Name: fma
### Title: Fitting Factor Mixture Analysis model by the EM algorithm
### Aliases: fma
### Keywords: multivariate

### ** Examples

data(crabs)
y=as.matrix(crabs[,4:8])
fit=fma(y,k=2,r=1,it=50,eps=0.0001,scaling=TRUE) # without covariates
misc(fit$index,crabs[,1]) # compute the misclassification error

sex=as.double(crabs[,2])-1
fit=fma(y,k=2,r=1,x.z=sex,x.w=sex,it=50,eps=0.0001,scaling=TRUE) # with covariates



