library(multDM)


### Name: MDM.test
### Title: Computes Multivariate Diebold-Mariano Test for the Equal
###   Predictive Accuracy of Two or More Non-nested Forecasting Models.
### Aliases: MDM.test

### ** Examples

data(MDMforecasts)
ts <- MDMforecasts$ts
forecasts <- MDMforecasts$forecasts
MDM.test(realized=ts,evaluated=forecasts,q=10,statistic="S",loss.type="AE")



