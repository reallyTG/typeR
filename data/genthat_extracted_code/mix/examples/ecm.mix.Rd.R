library(mix)


### Name: ecm.mix
### Title: ECM Algorithm for Restricted General Location Model
### Aliases: ecm.mix
### Keywords: models

### ** Examples

data(stlouis)
s <- prelim.mix(stlouis,3)         # preliminary manipulations
margins <- c(1,2,3)          # saturated loglinear model
design <- diag(rep(1,12))     # identity matrix, D=no of cells
thetahat <- ecm.mix(s,margins,design)  # should be same as em.mix(s)
loglik.mix(s,thetahat)             # loglikelihood at thetahat



