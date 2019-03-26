library(abctools)


### Name: mc.ci
### Title: Diagnostic plots for model choice coverage output
### Aliases: mc.ci
### Keywords: htest hplot

### ** Examples

  ##The examples below are chosen to run relatively quickly (<5 mins)
  ##and do not represent recommended tuning choices.
  ## Not run: 
##D   index <- sample(1:2, 1E4, replace=TRUE)
##D   sumstat <- ifelse(index==1, rnorm(1E4,0,1), rnorm(1E4,0,rexp(1E4,1)))
##D   sumstat <- data.frame(ss=sumstat)
##D   covdiag <- cov.mc(index=index, sumstat=sumstat, testsets=1:100, 
##D   tol=seq(0.1,1,by=0.1), diagnostics=c("freq"))
##D   mc.ci(covdiag$raw, tol=0.5, modname=1, modtrue=index[1:100])
##D   
## End(Not run)



