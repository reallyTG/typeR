library(rddapp)


### Name: rd_sens_bw
### Title: Bandwidth Sensitivity Simulation for Regression Discontinuity
### Aliases: rd_sens_bw

### ** Examples

x <- runif(1000, -1, 1)
cov <- rnorm(1000)
y <- 3 + 2 * x + 3 * cov + 10 * (x >= 0) + rnorm(1000)
rd <- rd_est(y ~ x | cov, t.design = "geq")
rd_sens_bw(rd, bws = seq(.1, 1, length.out = 5))



