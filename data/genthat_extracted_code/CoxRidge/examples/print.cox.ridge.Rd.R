library(CoxRidge)


### Name: print.cox.ridge
### Title: Print a 'cox.ridge' object.
### Aliases: print.cox.ridge
### Keywords: print.coxr.ridge

### ** Examples


data(ova)
attach(ova)
X <- cbind(karn,diam,figo)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))})#standardize covariates
fit <- cox.ridge(Surv(time,death)~X,lambda=1,lambdaFixed=TRUE)
fit ##regression coefficients correspond to the standardized covariates
          


