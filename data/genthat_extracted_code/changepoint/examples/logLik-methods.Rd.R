library(changepoint)


### Name: logLik-methods
### Title: ~~ Methods for Function logLik ~~
### Aliases: logLik-methods logLik,cpt-method logLik,cpt.reg-method
###   logLik,cpt.range-method
### Keywords: methods cpt internal

### ** Examples

set.seed(1)
x=c(rnorm(50,0,1),rnorm(50,0,10),rnorm(50,0,5),rnorm(50,0,1))
out=cpt.var(x,penalty="Manual",pen.value="2*log(n)",method="BinSeg",Q=5)
logLik(out) # returns the raw scaled negative likelihood (925.8085) and the scaled negative
#likelihood + penalty (957.5984)



