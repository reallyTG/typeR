library(bayesm)


### Name: rhierLinearModel
### Title: Gibbs Sampler for Hierarchical Linear Model with Normal
###   Heterogeneity
### Aliases: rhierLinearModel
### Keywords: regression

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

nreg = 100
nobs = 100
nvar = 3
Vbeta = matrix(c(1, 0.5, 0, 0.5, 2, 0.7, 0, 0.7, 1), ncol=3)

Z = cbind(c(rep(1,nreg)), 3*runif(nreg))
Z[,2] = Z[,2] - mean(Z[,2])
nz = ncol(Z)
Delta = matrix(c(1,-1,2,0,1,0), ncol=2)
Delta = t(Delta) # first row of Delta is means of betas
Beta = matrix(rnorm(nreg*nvar),nrow=nreg)%*%chol(Vbeta) + Z%*%Delta

tau = 0.1
iota = c(rep(1,nobs))
regdata = NULL
for (reg in 1:nreg) { 
  X = cbind(iota, matrix(runif(nobs*(nvar-1)),ncol=(nvar-1)))
	y = X%*%Beta[reg,] + sqrt(tau)*rnorm(nobs)
	regdata[[reg]] = list(y=y, X=X) 
}

Data1 = list(regdata=regdata, Z=Z)
Mcmc1 = list(R=R, keep=1)

out = rhierLinearModel(Data=Data1, Mcmc=Mcmc1)

cat("Summary of Delta draws", fill=TRUE)
summary(out$Deltadraw, tvalues=as.vector(Delta))

cat("Summary of Vbeta draws", fill=TRUE)
summary(out$Vbetadraw, tvalues=as.vector(Vbeta[upper.tri(Vbeta,diag=TRUE)]))

## plotting examples
if(0){
  plot(out$betadraw)
  plot(out$Deltadraw)
}



