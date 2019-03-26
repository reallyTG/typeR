library(esaddle)


### Name: ecgf
### Title: Cumulant generating function estimation
### Aliases: ecgf

### ** Examples

X <- matrix(rnorm(2 * 1e3), 1e3, 2)
K <- ecgf(lambda = c(0, 0), X = X, mix = 0.5, grad = 2) 
K$K # CGF
K$dK # CGF' (gradient)
K$d2K # CGF'' (Hessian)



