library(natural)


### Name: olasso
### Title: Error standard deviation estimation using organic lasso
### Aliases: olasso

### ** Examples

set.seed(123)
sim <- make_sparse_model(n = 50, p = 200, alpha = 0.6, rho = 0.6, snr = 2, nsim = 1)
ol <- olasso(x = sim$x, y = sim$y[, 1])



