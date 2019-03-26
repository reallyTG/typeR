library(measures)


### Name: KendallTau
### Title: Kendall's tau
### Aliases: KendallTau

### ** Examples

n = 20
set.seed(123)
truth = rnorm(n)
response = rnorm(n)
KendallTau(truth, response)



