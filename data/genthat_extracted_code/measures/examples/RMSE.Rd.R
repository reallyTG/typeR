library(measures)


### Name: RMSE
### Title: Root mean squared error
### Aliases: RMSE

### ** Examples

n = 20
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
RMSE(truth, response)



