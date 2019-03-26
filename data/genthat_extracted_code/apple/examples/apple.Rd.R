library(apple)


### Name: apple
### Title: Approximate Path for Penalized Likelihood Estimator
### Aliases: apple

### ** Examples

p=10
n=200
d=5
coefs=c(3,1.5,0,0,2)
intercept=0
beta=rep(0,p)
beta[1:d]=coefs
X=matrix(rnorm(p*n), nrow=n)
mu=1/(1+exp(-X %*% beta-intercept))
y=rbinom(n,1,mu)
	
fit.apple=apple(X, y, family= "binomial")

plot(fit.apple)



