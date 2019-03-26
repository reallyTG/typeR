library(BART)


### Name: mc.lbart
### Title: Logit BART for dichotomous outcomes with Logistic latents and
###   parallel computation
### Aliases: mc.lbart
### Keywords: nonparametric tree regression nonlinear

### ** Examples

set.seed(99)
n=5000
x = sort(-2+4*runif(n))
X=matrix(x,ncol=1)
f = function(x) {return((1/2)*x^3)}
FL = function(x) {return(exp(x)/(1+exp(x)))}
pv = FL(f(x))
y = rbinom(n,1,pv)
np=100
xp=-2+4*(1:np)/np
Xp=matrix(xp,ncol=1)

## parallel::mcparallel/mccollect do not exist on windows
## if(.Platform$OS.type=='unix') {
## ##test BART with token run to ensure installation works
##     mf = mc.lbart(X, y, nskip=5, ndpost=5, mc.cores=1, seed=99)
## }

## Not run: 
##D set.seed(99)
##D pf = lbart(X,y,Xp)
##D 
##D plot(f(Xp), pf$yhat.test.mean, xlim=c(-4, 4), ylim=c(-4, 4),
##D      xlab='True f(x)', ylab='BART f(x)')
##D lines(c(-4, 4), c(-4, 4))
##D 
##D mf = mc.lbart(X,y,Xp, mc.cores=4, seed=99)
##D 
##D plot(f(Xp), mf$yhat.test.mean, xlim=c(-4, 4), ylim=c(-4, 4),
##D      xlab='True f(x)', ylab='BART f(x)')
##D lines(c(-4, 4), c(-4, 4))
##D 
##D par(mfrow=c(2,2))
##D 
##D plot(range(xp),range(pf$yhat.test),xlab='x',ylab='f(x)',type='n')
##D lines(x,f(x),col='blue',lwd=2)
##D lines(xp,apply(pf$yhat.test,2,mean),col='red')
##D qpl = apply(pf$yhat.test,2,quantile,probs=c(.025,.975))
##D lines(xp,qpl[1,],col='green',lty=1)
##D lines(xp,qpl[2,],col='green',lty=1)
##D title(main='BART::lbart f(x) with 0.95 intervals')
##D 
##D plot(range(xp),range(mf$yhat.test),xlab='x',ylab='f(x)',type='n')
##D lines(x,f(x),col='blue',lwd=2)
##D lines(xp,apply(mf$yhat.test,2,mean),col='red')
##D qpl = apply(mf$yhat.test,2,quantile,probs=c(.025,.975))
##D lines(xp,qpl[1,],col='green',lty=1)
##D lines(xp,qpl[2,],col='green',lty=1)
##D title(main='BART::mc.lbart f(x) with 0.95 intervals')
##D 
##D plot(pf$yhat.test.mean,apply(mf$yhat.test,2,mean),xlab='BART::lbart',ylab='BART::mc.lbart')
##D abline(0,1,col='red')
##D title(main="BART::lbart f(x) vs. BART::mc.lbart f(x)")
## End(Not run)



