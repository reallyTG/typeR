library(copula)


### Name: getTheta
### Title: Get the Parameter(s) of a Copula
### Aliases: getTheta getTheta-methods getTheta,parCopula-method
###   getTheta,copula-method getTheta,acopula-method
###   getTheta,xcopula-method getTheta,khoudrajiCopula-method
###   getTheta,mixCopula-method getTheta,rotCopula-method
### Keywords: manip methods

### ** Examples

showMethods("getTheta")
## Don't show: 
stopifnot(all.equal(
## End(Don't show)
getTheta(setTheta(copClayton, 0.5)) # is 0.5
## Don't show: 
, 0.5))
## End(Don't show)



