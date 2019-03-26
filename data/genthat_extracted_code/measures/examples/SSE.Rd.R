library(measures)


### Name: SSE
### Title: Sum of squared errors
### Aliases: SSE

### ** Examples

n = 20
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
SSE(truth, response)



