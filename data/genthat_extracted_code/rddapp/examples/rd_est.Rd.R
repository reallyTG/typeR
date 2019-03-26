library(rddapp)


### Name: rd_est
### Title: Regression Discontinuity Estimation
### Aliases: rd_est

### ** Examples

x <- runif(1000, -1, 1)
cov <- rnorm(1000)
y <- 3 + 2 * x + 3 * cov + 10 * (x >= 0) + rnorm(1000)
rd_est(y ~ x, t.design = "geq")
# Efficiency gains can be made by including covariates
rd_est(y ~ x | cov, t.design = "geq")



