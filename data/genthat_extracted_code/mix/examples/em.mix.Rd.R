library(mix)


### Name: em.mix
### Title: EM Algorithm for Unrestricted General Location Model
### Aliases: em.mix
### Keywords: models

### ** Examples

data(stlouis)
s <- prelim.mix(stlouis,3)    # do preliminary manipulations
thetahat <- em.mix(s)   # compute ML estimate
getparam.mix(s,thetahat, corr=TRUE) # look at estimated parameters



