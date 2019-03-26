library(simctest)


### Name: confint-methods
### Title: Methods for Function run in Package 'simctest'
### Aliases: confint confint-methods confint,ANY,ANY-method
###   confint,sampalgres,missing-method
### Keywords: methods

### ** Examples

alg<-getalgonthefly()
res <- run(alg, function() runif(1)<0.05);
res
confint(res)



