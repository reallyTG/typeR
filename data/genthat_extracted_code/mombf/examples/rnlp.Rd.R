library(mombf)


### Name: rnlp
### Title: Posterior sampling for Non-Local Priors
### Aliases: rnlp rnlp-methods
###   rnlp,ANY,matrix,missing,missing,missing-method
###   rnlp,ANY,matrix,missing,missing,msfit-method
###   rnlp,missing,missing,numeric,matrix,missing-method
### Keywords: models distribution

### ** Examples

#Generate data
set.seed(2)
n <- 10^3; tau <- 0.133; x <- rmvnorm(n,sigma=matrix(c(2,1,1,2),nrow=2))
thtrue <- c(0.5,1); phitrue <- 1
y <- thtrue[1]*x[,1] + thtrue[2]*x[,2] + rnorm(n,sd=sqrt(phitrue))

#Specify prior parameters
priorCoef <- imomprior(tau=1)
priorVar <- igprior(alpha=.01,lambda=.01)

th <- rnlp(y=y, x=x, niter=100, priorCoef=priorCoef, priorVar=priorVar)
colMeans(th)
acf(th[,1])[1]



