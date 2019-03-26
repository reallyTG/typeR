library(bayesm)


### Name: runiregGibbs
### Title: Gibbs Sampler for Univariate Regression
### Aliases: runiregGibbs
### Keywords: regression

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=1000} else {R=10}
set.seed(66)

n = 200
X = cbind(rep(1,n), runif(n))
beta = c(1,2)
sigsq = 0.25
y = X%*%beta + rnorm(n,sd=sqrt(sigsq))

out = runiregGibbs(Data=list(y=y, X=X), Mcmc=list(R=R))

cat("Summary of beta and Sigmasq draws", fill=TRUE)
summary(out$betadraw, tvalues=beta)
summary(out$sigmasqdraw, tvalues=sigsq)

## plotting examples
if(0){plot(out$betadraw)}



