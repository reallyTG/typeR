library(bayesm)


### Name: rhierBinLogit
### Title: MCMC Algorithm for Hierarchical Binary Logit
### Aliases: rhierBinLogit
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=10000} else {R=10}
set.seed(66)

nvar = 5              ## number of coefficients
nlgt = 1000           ## number of cross-sectional units
nobs = 10             ## number of observations per unit
nz = 2                ## number of regressors in mixing distribution

Z = matrix(c(rep(1,nlgt),runif(nlgt,min=-1,max=1)), nrow=nlgt, ncol=nz)
Delta = matrix(c(-2, -1, 0, 1, 2, -1, 1, -0.5, 0.5, 0), nrow=nz, ncol=nvar)
iota = matrix(1, nrow=nvar, ncol=1)
Vbeta = diag(nvar) + 0.5*iota%*%t(iota)

lgtdata=NULL
for (i in 1:nlgt) { 
  beta = t(Delta)%*%Z[i,] + as.vector(t(chol(Vbeta))%*%rnorm(nvar))
  X = matrix(runif(nobs*nvar), nrow=nobs, ncol=nvar)
  prob = exp(X%*%beta) / (1+exp(X%*%beta)) 
  unif = runif(nobs, 0, 1)
  y = ifelse(unif<prob, 1, 0)
  lgtdata[[i]] = list(y=y, X=X, beta=beta)
}

Data1 = list(lgtdata=lgtdata, Z=Z)
Mcmc1 = list(R=R)

out = rhierBinLogit(Data=Data1, Mcmc=Mcmc1)

cat("Summary of Delta draws", fill=TRUE)
summary(out$Deltadraw, tvalues=as.vector(Delta))

cat("Summary of Vbeta draws", fill=TRUE)
summary(out$Vbetadraw, tvalues=as.vector(Vbeta[upper.tri(Vbeta,diag=TRUE)]))

if(0){
## plotting examples
plot(out$Deltadraw,tvalues=as.vector(Delta))
plot(out$betadraw)
plot(out$Vbetadraw,tvalues=as.vector(Vbeta[upper.tri(Vbeta,diag=TRUE)]))
}




