library(norm)


### Name: getparam.norm
### Title: Extract normal parameters from packed storage
### Aliases: getparam.norm
### Keywords: regression

### ** Examples

data(mdata)
s <- prelim.norm(mdata)   #do preliminary manipulations
thetahat <- em.norm(s)   #compute MLE
getparam.norm(s,thetahat,corr=TRUE)$r #look at estimated correlations



