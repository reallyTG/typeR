library(mase)


### Name: ratioEstimator
### Title: Compute a ratio estimator
### Aliases: ratioEstimator

### ** Examples

library(survey)
data(api)
ratioEstimator(y = apisrs$api00, x_sample = apisrs$meals, 
x_pop = sum(apipop$meals), data_type = "total", pi = apisrs$pw^(-1), 
N = dim(apipop)[1])




