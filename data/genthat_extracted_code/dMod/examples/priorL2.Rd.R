library(dMod)


### Name: priorL2
### Title: L2 objective function for prior value
### Aliases: priorL2

### ** Examples

p <- c(A = 1, B = 2, C = 3, lambda = 0)
mu <- c(A = 0, B = 0)
obj <- priorL2(mu = mu, lambda = "lambda")
obj(pars = p + rnorm(length(p), 0, .1))



