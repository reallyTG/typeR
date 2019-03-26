library(simctest)


### Name: run-methods
### Title: Methods for Function run in Package 'simctest'
### Aliases: run run-methods run,sampalgPrecomp,ANY-method
###   run,sampalgonthefly,ANY-method run,mmctest,mmctSamplerGeneric-method
### Keywords: methods

### ** Examples

alg<-getalgonthefly()
res <- run(alg, function() runif(1)<0.2);
res



