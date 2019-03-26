library(natural)


### Name: olasso_path
### Title: Fit a linear model with organic lasso
### Aliases: olasso_path

### ** Examples

set.seed(123)
sim <- make_sparse_model(n = 50, p = 200, alpha = 0.6, rho = 0.6, snr = 2, nsim = 1)
ol_path <- olasso_path(x = sim$x, y = sim$y[, 1])




