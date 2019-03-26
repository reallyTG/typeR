library(bayesm)


### Name: rbprobitGibbs
### Title: Gibbs Sampler (Albert and Chib) for Binary Probit
### Aliases: rbprobitGibbs
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

## function to simulate from binary probit including x variable
simbprobit = function(X, beta) {
  y = ifelse((X%*%beta + rnorm(nrow(X)))<0, 0, 1)
  list(X=X, y=y, beta=beta)
}

nobs = 200
X = cbind(rep(1,nobs), runif(nobs), runif(nobs))
beta = c(0,1,-1)
nvar = ncol(X)
simout = simbprobit(X, beta)

Data1 = list(X=simout$X, y=simout$y)
Mcmc1 = list(R=R, keep=1)

out = rbprobitGibbs(Data=Data1, Mcmc=Mcmc1)
summary(out$betadraw, tvalues=beta)

## plotting example
if(0){plot(out$betadraw, tvalues=beta)}



