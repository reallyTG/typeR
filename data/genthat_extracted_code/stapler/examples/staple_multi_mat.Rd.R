library(stapler)


### Name: staple_multi_mat
### Title: STAPLE on Multi-class matrix
### Aliases: staple_multi_mat

### ** Examples

rm(list = ls())
x = matrix(rbinom(5000, size = 5, prob = 0.5), ncol = 1000)
  sens_init = 0.99999
  spec_init = 0.99999
  max_iter = 10000
  tol = .Machine$double.eps
  prior = "mean"
  verbose = TRUE
  trace = 25
  ties.method = "first"

res = staple_multi_mat(x)




