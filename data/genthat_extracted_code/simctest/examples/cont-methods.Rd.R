library(simctest)


### Name: cont-methods
### Title: Methods for Function 'cont' in Package 'simctest'
### Aliases: cont cont-methods cont,sampalgres-method
###   cont,sampalgontheflyres-method cont,mmctestres-method
### Keywords: methods

### ** Examples

res <- simctest(function() runif(1)>0.95,maxsteps=10);
res
res <- cont(res,1000)
res
res <- cont(res,1000)
res



