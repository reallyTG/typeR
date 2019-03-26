library(CoxRidge)


### Name: cox.ridge
### Title: Fit a Cox model with a ridge penalty on all covariates
### Aliases: cox.ridge
### Keywords: cox.ridge

### ** Examples

data(ova)
attach(ova)
X <- cbind(karn,diam,figo)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))})#standardize covariates
fit <- cox.ridge(Surv(time,death)~X,lambda=1)
fit ##regression coefficients correspond to the standardized covariates



