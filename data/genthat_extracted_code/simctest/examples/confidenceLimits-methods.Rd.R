library(simctest)


### Name: confidenceLimits-methods
### Title: Methods for class 'mmctestres' and 'mmctest', Package 'simctest'
### Aliases: confidenceLimits confidenceLimits-methods
###   confidenceLimits,mmctestres-method confidenceLimits,mmctest-method
### Keywords: methods

### ** Examples

  fun <- function(ind,n,data) sapply(1:length(ind), function(i) sum(runif(n[i])<=data[ind[i]]));
  i <- mmctSampler(fun,num=500,data=runif(500));
  a <- mmctest(h=hBH);
  a <- run(a, i, maxsteps=list(maxnum=1000000,undecided=10));
  res <- confidenceLimits(a);
  lower <- res$lowerLimits;
  upper <- res$upperLimits;



