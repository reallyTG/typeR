library(plaqr)


### Name: transform_plaqr
### Title: Transformation for Partially Linear Additive Quantile Regression
### Aliases: transform_plaqr

### ** Examples

data(simData)

simData$Y <- exp(simData$y)

transform_plaqr(Y~x1+x2+x3, nonlinVars=~z1+z2, data=simData) 

transform_plaqr(Y~x1+x2+x3, nonlinVars=~z1+z2, confint=.95, data=simData) 



