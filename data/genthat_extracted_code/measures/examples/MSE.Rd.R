library(measures)


### Name: MSE
### Title: Mean of squared errors
### Aliases: MSE

### ** Examples

n = 20
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
MSE(truth, response)



