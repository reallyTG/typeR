library(blackbox)


### Name: blackbox
### Title: Black box optimization and response surface exploration
### Aliases: blackbox blackbox-package

### ** Examples

fr <- function(v) { ## Rosenbrock Banana function with noise
  10 * (v["y"] - v["x"]^2)^2 + (1 - v["x"])^2 + rnorm(1,sd=0.1)
}
set.seed(123)

# Initial parameter values, including duplicates. See ?init_grid.
parsp <- init_grid(lower=c(x=0,y=0),upper=c(x=2,y=2))

# add function values
simuls <- cbind(parsp,bb=apply(parsp,1,"fr"))

## The following shows the backbone of the 'bboptim' code:

sorted_etc <- prepareData(data=simuls)
#   Then smoothing using GCV (beware of implicit 'decreasing=FALSE' argument)
gcvres <- calcGCV(sorted_etc)

## The results can be used as input to functions from other packages,
##  e.g. corrHLfit from spaMM:
## Not run: 
##D require(spaMM)
##D corrHLfit(bb ~ 1+Matern(1|x+y),data=sorted_etc,
##D           ranFix=list(rho=1/gcvres$CovFnParam[c("x", "y")],
##D           #         note '1/...'
##D                       nu=gcvres$CovFnParam[["smoothness"]],
##D                       phi=gcvres$pureRMSE^2,
##D           # note distinct meaning of lambda notation in spaMM and blackbox
##D                       lambda=with(gcvres,(pureRMSE^2)/lambdaEst)))
##D 
##D ## GCV is distinct from an REML fit:
##D corrHLfit(bb ~ 1+Matern(1|x+y),data=sorted_etc,
##D           init.corrHLfit=list(rho=c(1,1)))
## End(Not run)




