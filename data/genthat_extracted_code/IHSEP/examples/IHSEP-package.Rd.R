library(IHSEP)


### Name: IHSEP-package
### Title: Inhomogeneous Self-exciting Process
### Aliases: IHSEP-package IHSEP
### Keywords: package

### ** Examples

## Not run: 
##D ## simulate the times of a Poisson process on [0,1] with intensity
##D ## function nu(t)=100*(2+cos(2*pi*t)).
##D tms <- simPois(int=function(x)100*(2+cos(2*pi*x)),int.M=300)
##D ## calculate a nonparametric estimate of the intensity function
##D int <- lpint::lpint(tms,Tau=1)
##D matplot(int$x,int$y+qnorm(0.975)*outer(int$se,c(-1,0,1)),type="l",lty=c(2,1,2),
##D         col=1,xlab="t",ylab="nu(t)")
##D curve(100*(2+cos(2*pi*x)),add=TRUE,col="red")
##D 
##D ## simulate an IHSEP on [0,1] with baseline intensity function
##D ## nu(t)=100*(2+cos(2*pi*t)) and excitation function
##D ## g(t)=0.5*8*exp(-8*t)
##D asep <- simHawkes1(nu=function(x)200*(2+cos(2*pi*x)),nuM=600,
##D                               g=function(x)8*exp(-16*x),gM=8)
##D ## get the birth times of all generations and sort in ascending order 
##D tms <- sort(unlist(asep))
##D ## calculate the minus loglikelihood of an SEPP with the true parameters 
##D mloglik1a(tms,TT=1,nu=function(x)200*(2+cos(2*pi*x)),
##D           g=function(x)8*exp(-16*x),Ig=function(x)8/16*(1-exp(-18*x)))
##D ## calculate the MLE for the parameter assuming known parametric forms
##D ## of the baseline intensity and excitation functions  
##D est <- optim(c(400,200,2*pi,8,16),
##D              function(p){
##D                mloglik1a(jtms=tms,TT=1,
##D                          nu=function(x)p[1]+p[2]*cos(p[3]*x),
##D                          g=function(x)p[4]*exp(-p[5]*x),
##D                          Ig=function(x)p[4]/p[5]*(1-exp(-p[5]*x)))
##D              },
##D              hessian=TRUE,control=list(maxit=5000,trace=TRUE))
##D ## point estimate by MLE
##D est$par
##D ## standard error estimates:
##D diag(solve(est$hessian))^0.5
## End(Not run)



