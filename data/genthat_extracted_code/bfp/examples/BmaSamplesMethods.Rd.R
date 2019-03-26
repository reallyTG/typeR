library(bfp)


### Name: BmaSamples Methods
### Title: Other methods for BmaSamples objects
### Aliases: 'BmaSamples Methods' fitted.BmaSamples print.BmaSamples
###   residuals.BmaSamples
### Keywords: methods

### ** Examples

## construct a BayesMfp object
set.seed(19)

x1 <- rnorm (n=15)
x2 <- rbinom (n=15, size=20, prob=0.5) 
x3 <- rexp (n=15)

y <- rt (n=15, df=2)

test <- BayesMfp (y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels = 200, method="exhaustive")

## now draw samples from the Bayesian model average
testBma <- BmaSamples (test)

## the print method:
testBma

## the fitted method:
fitted(testBma)

## and the corresponding residuals:
residuals(testBma)




