library(smco)


### Name: smco
### Title: simple Monte Carlo optimizer using adaptive coordinate sampling
### Aliases: smco smco.default
### Keywords: optimize

### ** Examples

SphereModel.fcn <-
function( x ) {
  return(sum(x ^ 2))
}

f = SphereModel.fcn;    
ndim = 10; 
LB = rep( -600.000, ndim); 
UB = rep(  600.000, ndim); 
maxiter = 100; 

s = smco(par = NULL, fn = SphereModel.fcn, N = ndim, LB = LB,
    UB = UB, maxiter = maxiter, Co = 0.01, Cmin = 0.0001, 
    Cmax = 0.5, trc = TRUE, lambda = 20,
    useBFGS = TRUE, control = list(maxit = 10))



