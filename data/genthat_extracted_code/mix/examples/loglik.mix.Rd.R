library(mix)


### Name: loglik.mix
### Title: Loglikelihood for Incomplete Data under the General Location
###   Model
### Aliases: loglik.mix
### Keywords: models

### ** Examples

data(stlouis)
s <- prelim.mix(stlouis,3)       # preliminary manipulations
thetahat <- em.mix(s)      # MLE under unrestricted general location model
loglik.mix(s, thetahat)  # loglikelihood at thetahat



