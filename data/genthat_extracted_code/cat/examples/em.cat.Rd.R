library(cat)


### Name: em.cat
### Title: EM algorithm for incomplete categorical data
### Aliases: em.cat
### Keywords: models

### ** Examples

data(crimes)
crimes
s <- prelim.cat(crimes[,1:2],crimes[,3])     # preliminary manipulations
thetahat <- em.cat(s)                        # mle under saturated model
logpost.cat(s,thetahat)                      # loglikelihood at thetahat



