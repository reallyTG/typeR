library(sparsestep)


### Name: sparsestep-package
### Title: SparseStep: Approximating the Counting Norm for Sparse
###   Regularization
### Aliases: sparsestep-package

### ** Examples

x <- matrix(rnorm(100*20), 100, 20)
y <- rnorm(100)
fit <- sparsestep(x, y)
plot(fit)
fits <- path.sparsestep(x, y)
plot(fits)
x2 <- matrix(rnorm(50*20), 50, 20)
y2 <- predict(fits, x2)




