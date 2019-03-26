library(plaqr)


### Name: trans_parameter
### Title: Transformation of the Response Variable
### Aliases: trans_parameter

### ** Examples

data(simData)
simData$Y <- exp(simData$y)

tparam <- transform_plaqr(Y~x1+x2+x3, nonlinVars=~z1+z2, data=simData) 

simData$newy <- trans_parameter(simData$Y, tparam$parameter)

fit <- plaqr(newy~x1+x2+x3, nonlinVars=~z1+z2, data=simData) 

trans_parameter( predictInt(fit), tparam$parameter, inverse=TRUE)



