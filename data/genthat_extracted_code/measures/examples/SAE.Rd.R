library(measures)


### Name: SAE
### Title: Sum of absolute errors
### Aliases: SAE

### ** Examples

n = 20
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
SAE(truth, response)



