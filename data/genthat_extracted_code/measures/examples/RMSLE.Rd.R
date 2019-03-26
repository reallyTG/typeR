library(measures)


### Name: RMSLE
### Title: Root mean squared logarithmic error
### Aliases: RMSLE

### ** Examples

n = 20
set.seed(123)
truth = abs(rnorm(n))
response = abs(rnorm(n))
RMSLE(truth, response)



