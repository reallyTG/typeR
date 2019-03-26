library(measures)


### Name: MEDAE
### Title: Median of absolute errors
### Aliases: MEDAE

### ** Examples

n = 20
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
MEDAE(truth, response)



