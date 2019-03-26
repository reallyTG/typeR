library(rddapp)


### Name: mrd_impute
### Title: Multiple Imputation of Multivariate Regression Discontinuity
###   Estimation
### Aliases: mrd_impute

### ** Examples

x1 <- runif(1000, -1, 1)
x2 <- runif(1000, -1, 1)
cov <- rnorm(1000)
y <- 3 + 2 * (x1 >= 0) + 3 * cov + 10 * (x2 >= 0) + rnorm(1000)
group <- rep(1:10, each = 100)
# centering
mrd_impute(y ~ x1 + x2 | cov, impute = group, method = "center", t.design = c("geq", "geq"))
# univariate
mrd_impute(y ~ x1 + x2 | cov, impute = group, method = "univ", t.design = c("geq", "geq"))
# frontier
mrd_impute(y ~ x1 + x2 | cov, impute = group, method = "front", t.design = c("geq", "geq"))



