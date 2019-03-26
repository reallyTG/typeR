library(mlegp)


### Name: CV
### Title: Gaussian process cross-validation
### Aliases: CV calcPredictionErrorCV predictNewYCV
### Keywords: internal models

### ** Examples


## fit a single Gaussian process ##
x = -5:5; y1 = sin(x) + rnorm(length(x),sd=.1)
fit1 = mlegp(x, y1)

cv = CV(fit1)  ## note that cv is the same as fit1$cv




