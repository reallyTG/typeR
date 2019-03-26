library(nlshrink)


### Name: linshrink
### Title: Linear-shrinkage estimator of population eigenvalues.
### Aliases: linshrink

### ** Examples

linshrink(X = matrix(rnorm(1e4, mean = 5), nrow = 100, ncol = 100)) # 1 class; will be centered
linshrink(X = matrix(rnorm(1e4), nrow = 100, ncol = 100), k = 1) # 1 class; no centering



