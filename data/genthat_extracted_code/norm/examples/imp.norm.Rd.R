library(norm)


### Name: imp.norm
### Title: Impute missing multivariate normal data
### Aliases: imp.norm
### Keywords: regression

### ** Examples

data(mdata)
s <- prelim.norm(mdata)   #do preliminary manipulations
thetahat <- em.norm(s)   #find the mle
rngseed(1234567)   #set random number generator seed
ximp <- imp.norm(s,thetahat,mdata)  #impute missing data under the MLE



