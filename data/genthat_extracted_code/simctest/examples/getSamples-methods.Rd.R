library(simctest)


### Name: getSamples-methods
### Title: Methods for Function 'cont' in class 'mmctestres', Package
###   'simctest'
### Aliases: getSamples getSamples-methods
###   getSamples,mmctSamplerGeneric-method getSamples,mmctSampler-method
### Keywords: methods

### ** Examples

  fun <- function(ind,n,data) sapply(1:length(ind), function(i) sum(runif(n[i])<=data[ind[i]]));
  i <- mmctSampler(fun,num=500,data=runif(500));
  samples <- getSamples(i, c(1,2), c(2,2));



