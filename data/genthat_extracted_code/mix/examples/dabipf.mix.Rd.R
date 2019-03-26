library(mix)


### Name: dabipf.mix
### Title: Data Augmentation/Bayesian IPF Algorithm for Restricted General
###   Location Models
### Aliases: dabipf.mix
### Keywords: models

### ** Examples

data(stlouis)
s <- prelim.mix(stlouis,3)      # do preliminary manipulations
margins <- c(1,2,3)       # saturated contingency table model
design <- diag(rep(1,12))  # identity matrix  D=no of cells
thetahat <- ecm.mix(s,margins,design) # find ML estimate
rngseed(1234567)       # random generator seed
newtheta <- dabipf.mix(s,margins,design,thetahat,steps=200)
ximp <- imp.mix(s,newtheta,stlouis)   # impute under newtheta



