library(varband)


### Name: varband_path
### Title: Solve main optimization problem along a path of lambda
### Aliases: varband_path

### ** Examples

set.seed(123)
n <- 50
true <- varband_gen(p = 50, block = 5)
x <- sample_gen(L = true, n = n)
S <- crossprod(scale(x, center = TRUE, scale = FALSE))/n
path_res <- varband_path(S = S, w = FALSE, nlam = 40, flmin = 0.03)



