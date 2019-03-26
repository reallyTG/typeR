library(simctest)


### Name: mmctSampler-class
### Title: Class "mmctest"
### Aliases: mmctSampler-class
### Keywords: classes

### ** Examples

  fun <- function(ind,n,data) sapply(1:length(ind), function(i) sum(runif(n[i])<=data[ind[i]]));
  i <- mmctSampler(fun,num=500,data=runif(500));



