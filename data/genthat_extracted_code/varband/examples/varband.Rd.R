library(varband)


### Name: varband
### Title: Compute the varband estimate for a fixed tuning parameter value
###   with different penalty options.
### Aliases: varband

### ** Examples

set.seed(123)
n <- 50
true <- varband_gen(p = 50, block = 5)
x <- sample_gen(L = true, n = n)
S <- crossprod(scale(x, center = TRUE, scale = FALSE)) / n
init <- diag(1/sqrt(diag(S)))
# unweighted estimate
L_unweighted <- varband(S, lambda = 0.1, init, w = FALSE)
# weighted estimate
L_weighted <- varband(S, lambda = 0.1, init, w = TRUE)
# lasso estimate
L_lasso <- varband(S, lambda = 0.1, init, w = TRUE, lasso = TRUE)



