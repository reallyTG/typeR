library(simctest)


### Name: mmctestres-class
### Title: Class "mmctestres"
### Aliases: mmctestres-class show,mmctestres-method
### Keywords: classes

### ** Examples

  fun <- function(ind,n,data) sapply(1:length(ind), function(i) sum(runif(n[i])<=data[ind[i]]));
  i <- mmctSampler(fun,num=500,data=runif(500));
  a <- mmctest(h=hBH);
  a <- run(a, i, maxsteps=list(maxnum=1000000,undecided=10));
  # a is object of type "mmctestres" now



