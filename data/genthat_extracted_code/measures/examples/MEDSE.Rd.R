library(measures)


### Name: MEDSE
### Title: Median of squared errors
### Aliases: MEDSE

### ** Examples

n = 20
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
MEDSE(truth, response)



