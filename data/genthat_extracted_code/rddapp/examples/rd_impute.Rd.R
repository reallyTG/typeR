library(rddapp)


### Name: rd_impute
### Title: Multiple Imputation of Regression Discontinuity Estimation
### Aliases: rd_impute

### ** Examples

x <- runif(1000, -1, 1)
cov <- rnorm(1000)
y <- 3 + 2 * x + 3 * cov + 10 * (x < 0) + rnorm(1000)
group <- rep(1:10, each = 100)
rd_impute(y ~ x, impute = group, t.design = "l")
# Efficiency gains can be made by including covariates
rd_impute(y ~ x | cov, impute = group, t.design = "l")



