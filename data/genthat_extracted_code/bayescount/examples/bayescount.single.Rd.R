library(bayescount)


### Name: count.analysis
### Title: Analyse Count data using MCMC
### Aliases: count.analysis fec.analysis FEC.analysis bayescount.single
### Keywords: models

### ** Examples


# use a zero-inflated lognormal Poisson model to analyse some count
# data, and suppressing JAGS output:
# 
## Not run: 
##D results <- bayescount.single(data=c(0,5,3,7,0,4,3,8,0),
##D model="ZILP", silent.jags=TRUE)
## End(Not run)



