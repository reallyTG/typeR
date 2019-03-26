library(varband)


### Name: varband_cv
### Title: Perform nfolds-cross validation
### Aliases: varband_cv

### ** Examples

set.seed(123)
p <- 50
n <- 50
true <- varband_gen(p = p, block = 5)
x <- sample_gen(L = true, n = n)
res_cv <- varband_cv(x = x, w = FALSE, nlam = 40, flmin = 0.03)



