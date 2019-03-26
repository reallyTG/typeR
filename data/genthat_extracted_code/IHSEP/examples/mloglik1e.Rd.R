library(IHSEP)


### Name: mloglik1e
### Title: Minus loglikelihood of an IHSEP model
### Aliases: mloglik1e
### Keywords: point process likelihood

### ** Examples

## simulated data of an IHSEP on [0,1] with baseline intensity function
## nu(t)=200*(2+cos(2*pi*t)) and excitation function
## g(t)=8*exp(-16*t)
data(asep)

## get the birth times of all generations and sort in ascending order 
tms <- sort(unlist(asep))
## calculate the minus loglikelihood of an SEPP with the true parameters 
mloglik1e(tms,TT=1,nuvs=200*(2+cos(2*pi*tms)),
          gcoef=8*1:2,
          InuT=integrate(function(x)200*(2+cos(2*pi*x)),0,1)$value)
## calculate the MLE for the parameter assuming known parametric forms
## of the baseline intensity and excitation functions  
## Not run: 
##D system.time(est <- optim(c(400,200,2*pi,8,16),
##D                          function(p){
##D                            mloglik1e(jtms=tms,TT=1,
##D                                      nuvs=p[1]+p[2]*cos(p[3]*tms),
##D                                      gcoef=p[-(1:3)],
##D                                      InuT=integrate(function(x)p[1]+p[2]*cos(p[3]*x),
##D                                                     0,1)$value
##D                                      )
##D                          },hessian=TRUE,control=list(maxit=5000,trace=TRUE),
##D                          method="BFGS")
##D             )
##D ## point estimate by MLE
##D est$par
##D ## standard error estimates:
##D diag(solve(est$hessian))^0.5
## End(Not run)



