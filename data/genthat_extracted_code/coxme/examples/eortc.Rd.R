library(coxme)


### Name: eortc
### Title: Simulated data set based on an EORTC trial
### Aliases: eortc
### Keywords: datasets

### ** Examples

data(eortc)
coxme(Surv(y, uncens) ~ trt + (trt| center) + strata(center), eortc)



