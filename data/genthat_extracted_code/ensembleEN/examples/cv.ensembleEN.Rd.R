library(ensembleEN)


### Name: cv.ensembleEN
### Title: Ensembles of elastic net algorithm with a sparsity and diversity
###   penalty.
### Aliases: cv.ensembleEN

### ** Examples

library(MASS)
set.seed(1)
beta <- c(rep(5, 5), rep(0, 45))
Sigma <- matrix(0.5, 50, 50)
diag(Sigma) <- 1
x <- mvrnorm(50, mu = rep(0, 50), Sigma = Sigma)
y <- x %*% beta + rnorm(50)
fit <- cv.ensembleEN(x, y, num_models=2)
coefs <- predict(fit, type="coefficients")




