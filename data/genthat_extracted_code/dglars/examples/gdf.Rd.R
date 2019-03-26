library(dglars)


### Name: gdf
### Title: Estimate the Generalized Degrees-of-Freedom
### Aliases: gdf print.gof_dglars
### Keywords: models regression

### ** Examples

set.seed(123)
n <- 100
p <- 10
X <- matrix(rnorm(n*p), n, p)
b <- 1:2
eta <- b[1] + X[,1] * b[2]
mu <- binomial()$linkinv(eta)
y <- rbinom(n, 1, mu)
fit <- dglars(y ~ X, binomial)
gdf(fit)



