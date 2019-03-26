library(IHSEP)


### Name: mloglik0
### Title: Minus loglikelihood of an IHSEP model
### Aliases: mloglik0
### Keywords: point process likelihood

### ** Examples

## simulated data of an IHSEP on [0,1] with baseline intensity function
## nu(t)=200*(2+cos(2*pi*t)) and excitation function
## g(t)=8*exp(-16*t)
data(asep)

## get the birth times of all generations and sort in ascending order 
tms <- sort(unlist(asep))
## calculate the minus loglikelihood of an SEPP with the true parameters 
mloglik0(tms,TT=1,nu=function(x)200*(2+cos(2*pi*x)),
          g=function(x)8*exp(-16*x),Ig=function(x)8/16*(1-exp(-16*x)))
## calculate the MLE for the parameter assuming known parametric forms
## of the baseline intensity and excitation functions  
## Not run: 
##D system.time(est <- optim(c(400,200,2*pi,8,16),
##D                          function(p){
##D                            mloglik0(jtms=tms,TT=1,
##D                                      nu=function(x)p[1]+p[2]*cos(p[3]*x),
##D                                      g=function(x)p[4]*exp(-p[5]*x),
##D                                      Ig=function(x)p[4]/p[5]*(1-exp(-p[5]*x)))
##D                          },
##D                          hessian=TRUE,control=list(maxit=5000,trace=TRUE))
##D             )
##D ## point estimate by MLE
##D est$par
##D ## standard error estimates:
##D diag(solve(est$hessian))^0.5
## End(Not run)



