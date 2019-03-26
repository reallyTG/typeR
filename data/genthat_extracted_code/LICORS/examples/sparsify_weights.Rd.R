library(LICORS)


### Name: sparsify_weights
### Title: Sparsify weights
### Aliases: sparsify_weights
### Keywords: array manip

### ** Examples

WW <- matrix(c(rexp(10, 1/10), runif(10)), ncol = 5, byrow = FALSE)
WW <- normalize(WW)
WW_sparse <- sparsify_weights(WW, lambda = 0.1)
WW_more_sparse <- sparsify_weights(WW, lambda = 0.5)
compute_mixture_penalty(WW)
compute_mixture_penalty(WW_sparse)
compute_mixture_penalty(WW_more_sparse)



