library(measures)


### Name: MSLE
### Title: Mean squared logarithmic error
### Aliases: MSLE

### ** Examples

n = 20
set.seed(123)
truth = abs(rnorm(n))
response = abs(rnorm(n))
MSLE(truth, response)



