library(cat)


### Name: imp.cat
### Title: Impute missing categorical data
### Aliases: imp.cat
### Keywords: models

### ** Examples

data(crimes)
x      <- crimes[,-3]
counts <- crimes[,3]
s <- prelim.cat(x,counts)        # preliminary manipulations
thetahat <- em.cat(s)            # find ML estimate under saturated model
rngseed(7817)                    # set random number generator seed
theta <- da.cat(s,thetahat,50)   # take 50 steps from MLE
ximp  <- imp.cat(s,theta)        # impute once under theta
theta <- da.cat(s,theta,50)      # take another 50 steps
ximp  <- imp.cat(s,theta)        # impute again under new theta



