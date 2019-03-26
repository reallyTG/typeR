library(simctest)


### Name: rejProb-methods
### Title: Methods for class 'mmctestres' and 'mmctest', Package 'simctest'
### Aliases: rejProb rejProb-methods rejProb,mmctestres-method
###   rejProb,mmctest-method
### Keywords: methods

### ** Examples

  fun <- function(ind,n,data) sapply(1:length(ind), function(i) sum(runif(n[i])<=data[ind[i]]));
  i <- mmctSampler(fun,num=500,data=runif(500));
  a <- mmctest(h=hBH);
  a <- run(a, i, maxsteps=list(maxnum=1000000,undecided=10));
  rejProb(a);



