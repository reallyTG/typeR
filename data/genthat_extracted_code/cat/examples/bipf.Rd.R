library(cat)


### Name: bipf
### Title: Bayesian Iterative Proportional Fitting (BIPF)
### Aliases: bipf
### Keywords: models

### ** Examples

data(HairEyeColor)                     # load data
m=c(1,2,0,1,3,0,2,3)                   # no three-way interaction
thetahat <- ipf(HairEyeColor,margins=m,
            showits=TRUE)              # fit model
thetahat <- ipf(HairEyeColor+.5,m)     # find an interior starting value 
rngseed(1234567)                       # set random generator seed
theta <- bipf(HairEyeColor,m,
              start=thetahat,prior=0.5,
              steps=50)                # take 50 steps



