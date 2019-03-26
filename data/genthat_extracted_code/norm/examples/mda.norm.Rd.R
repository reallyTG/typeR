library(norm)


### Name: mda.norm
### Title: Monotone data augmentation for incomplete multivariate normal
###   data
### Aliases: mda.norm
### Keywords: multivariate

### ** Examples

data(mdata)
s <- prelim.norm(mdata)
thetahat <- em.norm(s)   #find the MLE for a starting value
rngseed(1234567)   #set random number generator seed
theta <- mda.norm(s,thetahat,steps=20,showits=TRUE)  # take 20 steps
getparam.norm(s,theta) # look at result



