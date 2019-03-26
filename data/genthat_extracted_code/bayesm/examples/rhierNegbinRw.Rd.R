library(bayesm)


### Name: rhierNegbinRw
### Title: MCMC Algorithm for Hierarchical Negative Binomial Regression
### Aliases: rhierNegbinRw
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

# Simulate from the Negative Binomial Regression
simnegbin = function(X, beta, alpha) {
  lambda = exp(X%*%beta)
  y = NULL
  for (j in 1:length(lambda)) {y = c(y, rnbinom(1, mu=lambda[j], size=alpha)) }
  return(y)
  }

nreg = 100        # Number of cross sectional units
T = 50            # Number of observations per unit
nobs = nreg*T
nvar = 2          # Number of X variables
nz = 2            # Number of Z variables
              
## Construct the Z matrix
Z = cbind(rep(1,nreg), rnorm(nreg,mean=1,sd=0.125))

Delta = cbind(c(4,2), c(0.1,-1))
alpha = 5
Vbeta = rbind(c(2,1), c(1,2))

## Construct the regdata (containing X)
simnegbindata = NULL
for (i in 1:nreg) {
    betai = as.vector(Z[i,]%*%Delta) + chol(Vbeta)%*%rnorm(nvar)
    X = cbind(rep(1,T),rnorm(T,mean=2,sd=0.25))
    simnegbindata[[i]] = list(y=simnegbin(X,betai,alpha), X=X, beta=betai)
}

Beta = NULL
for (i in 1:nreg) {Beta = rbind(Beta,matrix(simnegbindata[[i]]$beta,nrow=1))}
Data1 = list(regdata=simnegbindata, Z=Z)
Mcmc1 = list(R=R)

out = rhierNegbinRw(Data=Data1, Mcmc=Mcmc1)

cat("Summary of Delta draws", fill=TRUE)
summary(out$Deltadraw, tvalues=as.vector(Delta))

cat("Summary of Vbeta draws", fill=TRUE)
summary(out$Vbetadraw, tvalues=as.vector(Vbeta[upper.tri(Vbeta,diag=TRUE)]))

cat("Summary of alpha draws", fill=TRUE)
summary(out$alpha, tvalues=alpha)

## plotting examples
if(0){
  plot(out$betadraw)
  plot(out$alpha,tvalues=alpha)
  plot(out$Deltadraw,tvalues=as.vector(Delta))
}



