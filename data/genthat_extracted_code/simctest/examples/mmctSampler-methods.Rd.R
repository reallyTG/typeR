library(simctest)


### Name: mmctSampler-methods
### Title: Methods for class mmctSampler', Package 'simctest'
### Aliases: mmctSampler mmctSampler-methods
### Keywords: methods

### ** Examples

  fun <- function(ind,n,data) sapply(1:length(ind), function(i) sum(runif(n[i])<=data[ind[i]]));
  i <- mmctSampler(fun,num=500,data=runif(500));



