library(steadyICA)


### Name: dcovICA
### Title: ICA via distance covariance for 2 components
### Aliases: dcovICA
### Keywords: givens distance covariance ICA

### ** Examples

library(JADE)
library(ProDenICA)
set.seed(123)
simS = cbind(rjordan(letter='j',n=1024),rjordan(letter='m',n=1024))
simM = mixmat(p=2)
xData = simS%*%simM
xWhitened = whitener(xData)

#Define true unmixing matrix as true M multiplied by the estimated whitener:
#Call this the target matrix:
W.true <- solve(simM%*%xWhitened$whitener) 


a=Sys.time()
est.dCovICA = dcovICA(Z = xWhitened$Z,theta.0=0)
Sys.time()-a

#See the example with steadyICA for an explanation
#of the parameterization used in amari.error:
amari.error(t(est.dCovICA$W),W.true)

##NOTE: also try theta.0 = pi/4 since there may be local minima
  ## Not run: 
##D est.dcovICA = dcovICA(Z = xWhitened$Z,theta.0=pi/4)
##D   amari.error(t(est.dcovICA$W),W.true)
## End(Not run)

a=Sys.time()
est.steadyICA = steadyICA(X=xWhitened$Z,verbose=TRUE)
Sys.time()-a
amari.error(t(est.steadyICA$W),W.true)
##theta parameterization with optimize is much faster



