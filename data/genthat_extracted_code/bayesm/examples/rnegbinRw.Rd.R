library(bayesm)


### Name: rnegbinRw
### Title: MCMC Algorithm for Negative Binomial Regression
### Aliases: rnegbinRw
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0)  {R=1000} else {R=10}
set.seed(66)

simnegbin = function(X, beta, alpha) {
  # Simulate from the Negative Binomial Regression
  lambda = exp(X%*%beta)
  y = NULL
  for (j in 1:length(lambda)) { y = c(y, rnbinom(1, mu=lambda[j], size=alpha)) }
  return(y)
}

nobs = 500
nvar = 2 # Number of X variables
alpha = 5
Vbeta = diag(nvar)*0.01

# Construct the regdata (containing X)
simnegbindata = NULL
beta = c(0.6, 0.2)
X = cbind(rep(1,nobs), rnorm(nobs,mean=2,sd=0.5))
simnegbindata = list(y=simnegbin(X,beta,alpha), X=X, beta=beta)

Data1 = simnegbindata
Mcmc1 = list(R=R)

out = rnegbinRw(Data=Data1, Mcmc=list(R=R))

cat("Summary of alpha/beta draw", fill=TRUE)
summary(out$alphadraw, tvalues=alpha)
summary(out$betadraw, tvalues=beta)

## plotting examples
if(0){plot(out$betadraw)}



