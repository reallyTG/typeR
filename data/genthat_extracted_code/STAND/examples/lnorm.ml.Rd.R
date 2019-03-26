library(STAND)


### Name: lnorm.ml
### Title: ML Estimation for Lognormal Data with Non-detects
### Aliases: lnorm.ml
### Keywords: optimize htest

### ** Examples

# Calculate MLE for Example 2 in ORNLTM2005-52
data(beTWA)
mle.TWA<- unlist(lnorm.ml(beTWA)) # ML for Be monitoring data
mle.TWA[1:4]  #  ML estimates of parameters
mle.TWA[5:8]  #  Standard errors of ML estimates
mle.TWA[9:13] #  additional results from lnorm.ml



