library(CoxRidge)


### Name: Dynamic.Ridge
### Title: Fit a Cox model with time dependent effects of the covariates
###   and penalized likelihood.
### Aliases: Dynamic.Ridge
### Keywords: Dynamic.Ridge

### ** Examples

data(GBSG)
attach(GBSG)
X <- cbind(age,grade)
R <- cbind(tumsize,posnodal,prm,esm)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))}) #standardize covariates
R <- apply(R,2,function(x){(x-mean(x))/sqrt(var(x))}) #standardize covariates
Ft <- cbind(rep(1,nrow(X)),bs(rfst))

# a model with all covariates as time varying, simple penalty
fit.dr <- Dynamic.Ridge(rfst,cens,cbind(X,R),Ft=Ft,lambda=100,fun="simple",lambdaFixed=TRUE)
fit.dr  #regression coefficients correspond to the standardized covariates

# a model with all covariates as time varying, weighted penalty
fit.wdr <- Dynamic.Ridge(rfst,cens,cbind(X,R),Ft=Ft,lambda=324,theta=fit.dr$theta,
fun="weighted",mon=TRUE)
fit.wdr #regression coefficients correspond to the standardized covariates

# a model with fixed and time varying covariates
fit.dr <- Dynamic.Ridge(rfst,cens,X,R,Ft,lambda=150,fun="simple",lambdaFixed=TRUE)
fit.dr



