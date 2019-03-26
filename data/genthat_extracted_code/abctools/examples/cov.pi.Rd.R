library(abctools)


### Name: cov.pi
### Title: Coverage property diagnostics
### Aliases: cov.pi cov.mc covstats.pi covstats.mc
### Keywords: htest

### ** Examples

  ##The examples below are chosen to run relatively quickly (<5 mins)
  ##and do not represent recommended tuning choices.
  ## Not run: 
##D   data(musigma2)
##D   library(ggplot2)
##D   ##Parameter inference example
##D   parameters <- data.frame(par.sim)
##D   sumstats <- data.frame(stat.sim)
##D   covdiag <- cov.pi(param=parameters, sumstat=sumstats, testsets=1:100, 
##D   tol=seq(0.1,1,by=0.1), diagnostics=c("KS"))
##D 
##D   #Plot of diagnostic results
##D   qplot(x=tol, y=pvalue, facets=.~parameter, data=covdiag$diag) 
##D   #Plot of raw results for tol=0.5
##D   qplot(x=mu, data=subset(covdiag$raw, tol==0.5)) 
##D   #Plot of raw results for tol=0.5
##D   qplot(x=sigma2, data=subset(covdiag$raw, tol==0.5)) 
##D 
##D   #Compute CGR statistic and plot
##D   cgrout <- covstats.pi(covdiag$raw, diagnostics="CGR") 
##D   qplot(x=tol, y=pvalue, facets=.~parameter, data=cgrout) 
##D 
##D   ##Model choice example, based on simple simulated data
##D   index <- sample(1:2, 1E4, replace=TRUE)
##D   sumstat <- ifelse(index==1, rnorm(1E4,0,1), rnorm(1E4,0,rexp(1E4,1)))
##D   sumstat <- data.frame(ss=sumstat)
##D   covdiag <- cov.mc(index=index, sumstat=sumstat, testsets=1:100, 
##D   tol=seq(0.1,1,by=0.1), diagnostics=c("freq"))
##D   qplot(x=tol, y=pvalue, data=covdiag$diag)
##D   llout <- covstats.mc(covdiag$raw, index=index, 
##D   diagnostics="loglik.binary")
##D   qplot(x=tol, y=pvalue, data=llout)
##D   mc.ci(covdiag$raw, tol=0.5, modname=1, modtrue=index[1:200])
##D   
## End(Not run)



