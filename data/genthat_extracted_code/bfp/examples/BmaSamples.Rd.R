library(bfp)


### Name: BmaSamples
### Title: Bayesian model averaging over multiple fractional polynomial
###   models
### Aliases: BmaSamples
### Keywords: regression

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
testBma

## We can also draw predictive samples for new data points, but then
## we need to supply the new data to BmaSamples:
newdata <- data.frame(x1 = rnorm(15),
                      x2 = rbinom(n=15, size=5, prob=0.2) + 1,
                      x3 = rexp(n=15))
testBma <- BmaSamples(test, newdata=newdata)
predict(testBma)

## test that inclusion of zero samples works
testBma <- BmaSamples (test, includeZeroSamples=TRUE)
testBma



