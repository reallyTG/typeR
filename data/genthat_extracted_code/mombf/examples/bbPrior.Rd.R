library(mombf)


### Name: bbPrior
### Title: Priors on model space for variable selection problems
### Aliases: bbPrior unifPrior binomPrior
### Keywords: distribution

### ** Examples

library(mombf)
sel <- c(TRUE,TRUE,FALSE,FALSE)
unifPrior(sel,logscale=FALSE)
binomPrior(sel,prob=.5,logscale=FALSE)
bbPrior(sel,alpha=1,beta=1,logscale=FALSE)



