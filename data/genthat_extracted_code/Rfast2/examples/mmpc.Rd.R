library(Rfast2)


### Name: Max-Min Parents and Children
### Title: Max-Min Parents and Children
### Aliases: mmpc
### Keywords: Multiple Feature Signatures Feature Selection Variable
###   Selection

### ** Examples

set.seed(123)

# Dataset with continuous data
ds <- matrix(runif(100 * 500, 1, 100), ncol = 500)

# Class variable
tar <- 3 * ds[, 10] + 2 * ds[, 100] + 3 * ds[, 20] + rnorm(100, 0, 5)

mmpc(tar, ds, max_k = 3, alpha = 0.05, method = "pearson")



