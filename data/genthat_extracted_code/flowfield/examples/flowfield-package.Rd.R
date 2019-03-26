library(flowfield)


### Name: Flow Field Forecasting
### Title: Forecast of a univariate time series Flow Field Forecasting
### Aliases: 'Flow Field Forecasting'
### Keywords: package

### ** Examples

library(SemiPar)
data(lidar)

t <- lidar$range
y <- lidar$logratio

steps <- 10 # number of forecast steps (steps must be 10 or less)
flowfield(t,y,steps,TRUE)



