library(mix)


### Name: getparam.mix
### Title: Present Parameters of General Location Model in an
###   Understandable Format
### Aliases: getparam.mix
### Keywords: models

### ** Examples

data(stlouis)
s <- prelim.mix(stlouis,3)    # do preliminary manipulations
thetahat <- em.mix(s)   # compute ML estimate
getparam.mix(s, thetahat, corr=TRUE)$r   # look at estimated correlations 



