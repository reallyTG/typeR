library(bfp)


### Name: getPosteriorParms
### Title: Extract updated posterior parameters for the normal inverse
###   gamma distribution from a model, given a shrinkage factor.
### Aliases: getPosteriorParms
### Keywords: regression

### ** Examples

## construct a BayesMfp object
set.seed(19)

x1 <- rnorm (n=15)
x2 <- rbinom (n=15, size=20, prob=0.5) 
x3 <- rexp (n=15)

y <- rt (n=15, df=2)

test <- BayesMfp (y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels = 200, method="exhaustive")

## now get the posterior parameters of the third best model
getPosteriorParms(test[3])



