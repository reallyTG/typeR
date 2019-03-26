library(natural)


### Name: olasso_cv
### Title: Cross-validation for organic lasso
### Aliases: olasso_cv

### ** Examples

set.seed(123)
sim <- make_sparse_model(n = 50, p = 200, alpha = 0.6, rho = 0.6, snr = 2, nsim = 1)
ol_cv <- olasso_cv(x = sim$x, y = sim$y[, 1])



