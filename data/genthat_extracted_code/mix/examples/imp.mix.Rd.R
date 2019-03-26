library(mix)


### Name: imp.mix
### Title: Impute Missing Data Under General Location Model
### Aliases: imp.mix
### Keywords: models

### ** Examples

data(stlouis)
s <- prelim.mix(stlouis,3)    # do preliminary manipulations
thetahat <- em.mix(s)   # ML estimate for unrestricted model
rngseed(1234567)     # set random number generator seed
newtheta <- da.mix(s,thetahat,steps=100) # data augmentation
ximp <- imp.mix(s, newtheta, stlouis)  # impute under newtheta



