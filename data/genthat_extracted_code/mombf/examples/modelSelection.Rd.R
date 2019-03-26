library(mombf)


### Name: modelSelection
### Title: Bayesian variable selection for linear models via non-local
###   priors.
### Aliases: modelSelection modelsearchBlockDiag
### Keywords: models htest

### ** Examples

#Simulate data
x <- matrix(rnorm(100*3),nrow=100,ncol=3)
theta <- matrix(c(1,1,0),ncol=1)
y <- x %*% theta + rnorm(100)

#Specify prior parameters
priorCoef <- imomprior(tau=1)
priorDelta <- modelunifprior()
priorVar <- igprior(alpha=.01,lambda=.01)

#Alternative prior for model space: 0.5 prior prob for including any covariate
priorDelta <- modelbinomprior(p=0.5)

#Alternative prior for model space: Beta hyper-prior for prob of inclusion
priorDelta <- modelbbprior(alpha.p=1,beta.p=1)

#Model selection
fit1 <- modelSelection(y=y, x=x, center=FALSE, scale=FALSE, niter=10^2,
priorCoef=priorCoef, priorDelta=priorDelta, priorVar=priorVar, phi=1,
method='Laplace')
fit1$postMode
fit1$margpp
postProb(fit1)




