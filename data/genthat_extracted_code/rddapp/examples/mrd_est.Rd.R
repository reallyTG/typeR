library(rddapp)


### Name: mrd_est
### Title: Multivariate Regression Discontinuity Estimation
### Aliases: mrd_est

### ** Examples

x1 <- runif(1000, -1, 1)
x2 <- runif(1000, -1, 1)
cov <- rnorm(1000)
y <- 3 + 2 * (x1 >= 0) + 3 * cov + 10 * (x2 >= 0) + rnorm(1000)
# centering
mrd_est(y ~ x1 + x2 | cov, method = "center", t.design = c("geq", "geq"))
# univariate
mrd_est(y ~ x1 + x2 | cov, method = "univ", t.design = c("geq", "geq"))
# frontier
mrd_est(y ~ x1 + x2 | cov, method = "front", t.design = c("geq", "geq"))



