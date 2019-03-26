library(measures)


### Name: ARSQ
### Title: Adjusted coefficient of determination
### Aliases: ARSQ

### ** Examples

n = 20
p = 5
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
ARSQ(truth, response, n, p)



