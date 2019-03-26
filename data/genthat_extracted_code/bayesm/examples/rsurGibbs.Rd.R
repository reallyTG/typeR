library(bayesm)


### Name: rsurGibbs
### Title: Gibbs Sampler for Seemingly Unrelated Regressions (SUR)
### Aliases: rsurGibbs
### Keywords: regression

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=1000} else {R=10}
set.seed(66)

## simulate data from SUR
beta1 = c(1,2)
beta2 = c(1,-1,-2)
nobs = 100
nreg = 2
iota = c(rep(1, nobs))
X1 = cbind(iota, runif(nobs))
X2 = cbind(iota, runif(nobs), runif(nobs))
Sigma = matrix(c(0.5, 0.2, 0.2, 0.5), ncol=2)
U = chol(Sigma)
E = matrix(rnorm(2*nobs),ncol=2)%*%U
y1 = X1%*%beta1 + E[,1]
y2 = X2%*%beta2 + E[,2]

## run Gibbs Sampler
regdata = NULL
regdata[[1]] = list(y=y1, X=X1)
regdata[[2]] = list(y=y2, X=X2)

out = rsurGibbs(Data=list(regdata=regdata), Mcmc=list(R=R))

cat("Summary of beta draws", fill=TRUE)
summary(out$betadraw, tvalues=c(beta1,beta2))

cat("Summary of Sigmadraws", fill=TRUE)
summary(out$Sigmadraw, tvalues=as.vector(Sigma[upper.tri(Sigma,diag=TRUE)]))

## plotting examples
if(0){plot(out$betadraw, tvalues=c(beta1,beta2))}



