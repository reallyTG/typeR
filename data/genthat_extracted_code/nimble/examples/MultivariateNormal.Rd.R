library(nimble)


### Name: MultivariateNormal
### Title: The Multivariate Normal Distribution
### Aliases: MultivariateNormal dmnorm_chol rmnorm_chol

### ** Examples

mean <- c(-10, 0, 10)
covmat <- matrix(c(1, .9, .3, .9, 1, -0.1, .3, -0.1, 1), 3)
ch <- chol(covmat)
x <- rmnorm_chol(1, mean, ch, prec_param = FALSE)
dmnorm_chol(x, mean, ch, prec_param = FALSE)



