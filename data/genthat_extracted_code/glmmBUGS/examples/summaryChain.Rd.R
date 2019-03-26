library(glmmBUGS)


### Name: summaryChain
### Title: Compute mean, standard deviation, and quantiles of an MCMC run
### Aliases: summaryChain

### ** Examples

# create a simple chain
thechain = list(beta = array(1, c(10, 3,4), 
dimnames = list(NULL, NULL, paste("beta[", 1:4, "]", sep=""))), 
intercept = matrix(1, 10, 3))

summaryChain(thechain)



