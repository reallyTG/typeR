library(bfp)


### Name: BayesMfp
### Title: Bayesian model inference for multiple fractional polynomial
###   models
### Aliases: BayesMfp bfp uc
### Keywords: regression

### ** Examples

## generate some data
set.seed(19)

x1 <- rnorm(n=15)
x2 <- rbinom(n=15, size=20, prob=0.5) 
x3 <- rexp(n=15)

y <- rt(n=15, df=2)

## run an exhaustive model space evaluation with a flat model prior and
## a uniform prior (a = 4) on the shrinkage factor t = g/(1 + g):
test <- BayesMfp(y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels = 100,
                 method="exhaustive")
test

## now the same with a *dependent* model prior:
test2 <- BayesMfp(y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels = 100,
		 priorSpecs = list(a = 4, modelPrior = "dependent"),
                 method="exhaustive")
test2



