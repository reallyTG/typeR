library(flowfield)


### Name: flowfield
### Title: Flow Field Forecasting
### Aliases: flowfield
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(SemiPar)
data(lidar)

t <- lidar$range
y <- lidar$logratio

steps <- 10 # number of forecast steps (steps must be 10 or less)
flowfield(t,y,steps,TRUE)



