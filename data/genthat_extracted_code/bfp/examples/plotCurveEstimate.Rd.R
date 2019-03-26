library(bfp)


### Name: plotCurveEstimate
### Title: Generic function for plotting a fractional polynomial curve
###   estimate
### Aliases: plotCurveEstimate plotCurveEstimate.BayesMfp
###   plotCurveEstimate.BmaSamples
### Keywords: regression

### ** Examples

## construct a BayesMfp object
set.seed(19)
x1 <- rnorm (n=15)
x2 <- rbinom (n=15, size=20, prob=0.5) 
x3 <- rexp (n=15)
y <- rt (n=15, df=2)

test <- BayesMfp (y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels = 100,
method="exhaustive")

## plot the x2 curve estimate for the 20-th best model
p1 <- plotCurveEstimate (test[20], "x2")

## look at the returned list
str(p1)

## plot the BMA curve estimate for the same covariate
testBma <- BmaSamples (test)
p2 <- plotCurveEstimate (testBma, "x2")

## look at the returned list
str(p2)

## try the new options:
plotCurveEstimate (testBma, "x2", partialResids=FALSE, hpd=FALSE)



