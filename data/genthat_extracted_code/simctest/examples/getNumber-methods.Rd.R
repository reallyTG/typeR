library(simctest)


### Name: getNumber-methods
### Title: Methods for Function 'cont' in class 'mmctestres', Package
###   'simctest'
### Aliases: getNumber getNumber-methods
###   getNumber,mmctSamplerGeneric-method getNumber,mmctSampler-method
### Keywords: methods

### ** Examples

  fun <- function(ind,n,data) sapply(1:length(ind), function(i) sum(runif(n[i])<=data[ind[i]]));
  i <- mmctSampler(fun,num=500,data=runif(500));
  number <- getNumber(i);



