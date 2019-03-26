library(np)


### Name: npuniden.sc
### Title: Kernel Shape Constrained Bounded Univariate Density Estimation
### Aliases: npuniden.sc
### Keywords: nonparametric smooth

### ** Examples

## Not run: 
##D n <- 100
##D set.seed(42)
##D 
##D ## Example 1: N(0,1), constrain the density to lie within lb=.1 and ub=.2
##D 
##D X <- sort(rnorm(n))
##D h <- npuniden.boundary(X,a=-Inf,b=Inf)$h
##D foo <- npuniden.sc(X,h=h,constraint="density",a=-Inf,b=Inf,lb=.1,ub=.2)
##D ylim <- range(c(foo$f.sc,foo$f))
##D plot(X,foo$f.sc,type="l",ylim=ylim,xlab="X",ylab="Density")
##D lines(X,foo$f,col=2,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained","Unconstrained"),lty=1:2,col=1:2,bty="n")
##D 
##D ## Example 2: Beta(5,1), DGP is monotone increasing, impose valid
##D ## restriction
##D 
##D X <- sort(rbeta(n,5,1))
##D h <- npuniden.boundary(X)$h
##D 
##D foo <- npuniden.sc(X=X,h=h,constraint=c("mono.incr"))
##D 
##D par(mfrow=c(1,2))
##D ylim <- range(c(foo$f.sc,foo$f))
##D plot(X,foo$f.sc,type="l",ylim=ylim,xlab="X",ylab="Density")
##D lines(X,foo$f,col=2,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained","Unconstrained"),lty=1:2,col=1:2,bty="n")
##D 
##D ylim <- range(c(foo$f.sc.deriv,foo$f.deriv))
##D plot(X,foo$f.sc.deriv,type="l",ylim=ylim,xlab="X",ylab="First Derivative")
##D lines(X,foo$f.deriv,col=2,lty=2)
##D abline(h=0,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained","Unconstrained"),lty=1:2,col=1:2,bty="n")
##D 
##D ## Example 3: Beta(1,5), DGP is monotone decreasing, impose valid
##D ## restriction
##D 
##D X <- sort(rbeta(n,1,5))
##D h <- npuniden.boundary(X)$h
##D 
##D foo <- npuniden.sc(X=X,h=h,constraint=c("mono.decr"))
##D 
##D par(mfrow=c(1,2))
##D ylim <- range(c(foo$f.sc,foo$f))
##D plot(X,foo$f.sc,type="l",ylim=ylim,xlab="X",ylab="Density")
##D lines(X,foo$f,col=2,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained","Unconstrained"),lty=1:2,col=1:2,bty="n")
##D 
##D ylim <- range(c(foo$f.sc.deriv,foo$f.deriv))
##D plot(X,foo$f.sc.deriv,type="l",ylim=ylim,xlab="X",ylab="First Derivative")
##D lines(X,foo$f.deriv,col=2,lty=2)
##D abline(h=0,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained","Unconstrained"),lty=1:2,col=1:2,bty="n")
##D  
##D ## Example 4: N(0,1), DGP is log-concave, impose invalid concavity
##D ## restriction
##D 
##D X <- sort(rnorm(n))
##D h <- npuniden.boundary(X,a=-Inf,b=Inf)$h
##D 
##D foo <- npuniden.sc(X=X,h=h,a=-Inf,b=Inf,constraint=c("concave"))
##D 
##D par(mfrow=c(1,2))
##D ylim <- range(c(foo$f.sc,foo$f))
##D plot(X,foo$f.sc,type="l",ylim=ylim,xlab="X",ylab="Density")
##D lines(X,foo$f,col=2,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained","Unconstrained"),lty=1:2,col=1:2,bty="n")
##D ylim <- range(c(foo$f.sc.deriv,foo$f.deriv))
##D 
##D plot(X,foo$f.sc.deriv,type="l",ylim=ylim,xlab="X",ylab="Second Derivative")
##D lines(X,foo$f.deriv,col=2,lty=2)
##D abline(h=0,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained","Unconstrained"),lty=1:2,col=1:2,bty="n")
##D 
##D ## Example 45: Beta(3/4,3/4), DGP is convex, impose valid restriction
##D 
##D X <- sort(rbeta(n,3/4,3/4))
##D h <- npuniden.boundary(X)$h
##D 
##D foo <- npuniden.sc(X=X,h=h,constraint=c("convex"))
##D 
##D par(mfrow=c(1,2))
##D ylim <- range(c(foo$f.sc,foo$f))
##D plot(X,foo$f.sc,type="l",ylim=ylim,xlab="X",ylab="Density")
##D lines(X,foo$f,col=2,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained","Unconstrained"),lty=1:2,col=1:2,bty="n")
##D 
##D ylim <- range(c(foo$f.sc.deriv,foo$f.deriv))
##D plot(X,foo$f.sc.deriv,type="l",ylim=ylim,xlab="X",ylab="Second Derivative")
##D lines(X,foo$f.deriv,col=2,lty=2)
##D abline(h=0,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained","Unconstrained"),lty=1:2,col=1:2,bty="n")
##D 
##D ## Example 6: N(0,1), DGP is log-concave, impose log-concavity
##D ## restriction
##D 
##D X <- sort(rnorm(n))
##D h <- npuniden.boundary(X,a=-Inf,b=Inf)$h
##D 
##D foo <- npuniden.sc(X=X,h=h,a=-Inf,b=Inf,constraint=c("log-concave"))
##D 
##D par(mfrow=c(1,2))
##D 
##D ylim <- range(c(log(foo$f.sc),log(foo$f)))
##D plot(X,log(foo$f.sc),type="l",ylim=ylim,xlab="X",ylab="Log-Density")
##D lines(X,log(foo$f),col=2,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained-log","Unconstrained-log"),lty=1:2,col=1:2,bty="n")
##D 
##D ylim <- range(c(foo$f.sc.deriv,foo$f.deriv))
##D plot(X,foo$f.sc.deriv,type="l",ylim=ylim,xlab="X",ylab="Second Derivative of Log-Density")
##D lines(X,foo$f.deriv,col=2,lty=2)
##D abline(h=0,lty=2)
##D rug(X)
##D legend("topleft",c("Constrained-log","Unconstrained-log"),lty=1:2,col=1:2,bty="n")
## End(Not run) 



