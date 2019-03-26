library(drc)


### Name: daphnids
### Title: Daphnia test
### Aliases: daphnids
### Keywords: datasets

### ** Examples


## Fitting a model with different parameters
## for different curves
daphnids.m1 <- drm(no/total~dose, time, weights = total, 
data = daphnids, fct = LL.2(), type = "binomial")

## Goodness-of-fit test
modelFit(daphnids.m1)

## Summary of the data
summary(daphnids.m1)

## Fitting a model with a common intercept parameter
daphnids.m2 <- drm(no/total~dose, time, weights = total, 
data = daphnids, fct = LL.2(), type = "binomial", 
pmodels = list(~1, ~time))




