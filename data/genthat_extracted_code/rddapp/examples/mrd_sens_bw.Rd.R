library(rddapp)


### Name: mrd_sens_bw
### Title: Bandwidth Sensitivity Simulation for Multivariate Regression
###   Discontinuity
### Aliases: mrd_sens_bw

### ** Examples

x1 <- runif(1000, -1, 1)
x2 <- rnorm(1000, 10, 2)
cov <- rnorm(1000)
y <- 3 + 2 * x1 + 1 * x2 + 3 * cov + 10 * (x1 >= 0) + 5 * (x2 >= 10) + rnorm(1000)
mrd <- mrd_est(y ~ x1 + x2 | cov, cutpoint = c(0, 10), t.design = c("geq", "geq"))
mrd_sens_bw(mrd, approach = "univ1", bws = seq(0.1, 1, length.out = 5))



