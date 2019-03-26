library(norm)


### Name: logpost.norm
### Title: Observed-data log-posterior for normal data
### Aliases: logpost.norm
### Keywords: multivariate

### ** Examples

data(mdata)
s <- prelim.norm(mdata)   #do preliminary manipulations
prior <- list(0,.5,rep(0,ncol(mdata)),
   .5*diag(rep(1,ncol(mdata)))) #ridge prior with .5 df
thetahat <- em.norm(s,prior=prior)   #compute posterior mode
logpost.norm(s,thetahat,prior)  #log-posterior at mode



