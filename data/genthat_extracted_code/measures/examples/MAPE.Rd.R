library(measures)


### Name: MAPE
### Title: Mean absolute percentage error
### Aliases: MAPE

### ** Examples

n = 20
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
MAPE(truth, response)



