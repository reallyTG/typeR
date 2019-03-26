library(iTOP)


### Name: rv.coef
### Title: Computes the RV coefficient
### Aliases: rv.coef

### ** Examples

set.seed(2)
n = 100
p = 100
x1 = matrix(rnorm(n*p), n, p)
x2 = x1 + matrix(rnorm(n*p), n, p)
S1 = compute.config.matrix(x1)
S2 = compute.config.matrix(x1)
rv.coef(S1, S2)



