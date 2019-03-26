library(cat)


### Name: mda.cat
### Title: Monotone Data Augmentation algorithm for incomplete categorical
###   data
### Aliases: mda.cat
### Keywords: models

### ** Examples

data(older)
x      <- older[1:80,1:4]               # subset of the data with
counts <- older[1:80,7]                 # monotone pattern.
s <- prelim.cat(x,counts)               # preliminary manipulations
thetahat <- em.cat(s)                   # mle under saturated model
rngseed(7817)                           # set random generator seed
theta <- mda.cat(s,thetahat,50)         # take 50 steps from mle
ximp <- imp.cat(s,theta)                # impute under theta
theta <- mda.cat(s,theta,50)            # take another 50 steps
ximp <- imp.cat(s,theta)                # impute under new theta



