library(BVS)


### Name: fitBVS
### Title: Function to calculate fitness for each model for Bayesian
###   Variant Selection Methods
### Aliases: fitBVS
### Keywords: fitness

### ** Examples

## Load the data for Rare variant example
data(RareData)
p = dim(RareData)[2] -1

## Fit the Null model
fit.null = fitBVS(rep(0,p),data=RareData,rare=TRUE)


