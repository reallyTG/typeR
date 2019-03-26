library(mix)


### Name: da.mix
### Title: Data Augmentation for Unrestricted General Location Model
### Aliases: da.mix
### Keywords: models

### ** Examples

data(stlouis)
s <- prelim.mix(stlouis,3)  # preliminary manipulations
thetahat <- em.mix(s) # find ML estimate
rngseed(1234567)   # set random number generator seed
newtheta <- da.mix(s, thetahat, steps=100, showits=TRUE)  # take 100 steps
ximp1 <- imp.mix(s, newtheta) # impute under newtheta



