library(mombf)


### Name: pmomLM
### Title: Bayesian variable selection and model averaging for linear and
###   probit models via non-local priors.
### Aliases: pmomLM pmomPM emomLM emomPM pplPM ppmodel
### Keywords: models htest

### ** Examples

#Simulate data
x <- matrix(rnorm(100*3),nrow=100,ncol=3)
xadj <- rep(1,nrow(x))
theta <- matrix(c(1,1,0),ncol=1)
y <- 10*xadj + x %*% theta + rnorm(100)

#Beta-binomial prior on model space
priorDelta <- modelbbprior(alpha.p=1,beta.p=1)

#Non-informative prior on residual variance
priorVar <- igprior(alpha=.01,lambda=.01)

#Product MOM prior with tau=0.3 on x coefficients
#Non-informative prior on xadj coefficients
priorCoef <- momprior(tau=0.3, tau.adj=10^6)

mom0 <- pmomLM(y=y,x=x,xadj=xadj,center=FALSE,scale=FALSE,niter=1000,
priorCoef=priorCoef,priorDelta=priorDelta,priorVar=priorVar)
round(colMeans(mom0$postModel),2)
round(colMeans(mom0$postCoef1),2)
round(colMeans(mom0$postCoef2),2)

#Alternative prior: hyper-prior on tau
priorCoef <- new("msPriorSpec",priorType='coefficients',priorDistr='pMOM',
priorPars=c(a.tau=1,b.tau=.135,tau.adj=10^6,r=1)) #hyper-prior
mom1 <-
pmomLM(y=y,x=x,xadj=xadj,center=FALSE,scale=FALSE,niter=1000,
priorCoef=priorCoef,priorDelta=priorDelta,priorVar=priorVar)
mean(mom1$postOther)  #posterior mean for tau

#Probit model
n <- 500; rho <- .25; niter <- 1000
theta <- c(.4,.6,0); theta.adj <- 0
V <- diag(length(theta)); V[upper.tri(V)] <- V[lower.tri(V)] <- rho
x <- rmvnorm(n,rep(0,length(theta)),V); xadj <- matrix(1,nrow=nrow(x),ncol=1)
lpred <- as.vector(x %*% matrix(theta,ncol=1) + xadj %*% matrix(theta.adj,ncol=1))
p <- pnorm(lpred)
y <- runif(n)<p

mom2 <- pmomPM(y=y,x=x,xadj=xadj,niter=1000,priorCoef=priorCoef,
priorDelta=priorDelta,initSearch='greedy')
colMeans(mom2$postCoef1)
coef(glm(y ~ x + xadj -1, family=binomial(link='probit')))



