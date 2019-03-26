library(CoxRidge)


### Name: print.cox.dynamic.ridge
### Title: Print a 'cox.dynamic.ridge' object.
### Aliases: print.cox.dynamic.ridge
### Keywords: print.cox.dynamic.ridge

### ** Examples

data(GBSG)
attach(GBSG)
X <- cbind(age,grade)
R <- cbind(tumsize,posnodal,prm,esm)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))}) #standardize covariates
R <- apply(R,2,function(x){(x-mean(x))/sqrt(var(x))}) #standardize covariates
Ft <- cbind(rep(1,nrow(X)),bs(rfst))

# a model with all covariates as time varying, simple penalty
fit.dr <- Dynamic.Ridge(rfst,cens,cbind(X,R),Ft=Ft,lambda=10,fun="simple",lambdaFixed=TRUE)
fit.dr
          


