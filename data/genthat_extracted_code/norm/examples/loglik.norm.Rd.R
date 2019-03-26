library(norm)


### Name: loglik.norm
### Title: Observed-data loglikelihood for normal data
### Aliases: loglik.norm
### Keywords: multivariate

### ** Examples

data(mdata)
s <- prelim.norm(mdata)   #do preliminary manipulations
thetahat <- em.norm(s)   #compute MLE
loglik.norm(s,thetahat)  #loglikelihood at the MLE



