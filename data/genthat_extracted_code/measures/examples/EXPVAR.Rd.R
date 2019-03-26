library(measures)


### Name: EXPVAR
### Title: Explained variance
### Aliases: EXPVAR

### ** Examples

n = 20
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
EXPVAR(truth, response)



