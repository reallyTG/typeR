library(norm)


### Name: em.norm
### Title: EM algorithm for incomplete normal data
### Aliases: em.norm
### Keywords: regression

### ** Examples

data(mdata)
s <- prelim.norm(mdata)   #do preliminary manipulations
thetahat <- em.norm(s)   #compute mle
getparam.norm(s,thetahat,corr=TRUE)$r #look at estimated correlations



