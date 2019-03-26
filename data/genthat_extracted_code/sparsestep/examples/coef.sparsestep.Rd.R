library(sparsestep)


### Name: coef.sparsestep
### Title: Get the coefficients of a fitted SparseStep model
### Aliases: coef coef.sparsestep

### ** Examples

x <- matrix(rnorm(100*20), 100, 20)
y <- rnorm(100)
fit <- sparsestep(x, y)
coef(fit)




