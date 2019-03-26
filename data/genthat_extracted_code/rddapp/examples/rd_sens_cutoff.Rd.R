library(rddapp)


### Name: rd_sens_cutoff
### Title: Cutoff Sensitivity Simulation for Regression Discontinuity
### Aliases: rd_sens_cutoff

### ** Examples

x <- runif(1000, -1, 1)
cov <- rnorm(1000)
y <- 3 + 2 * x + 3 * cov + 10 * (x >= 0) + rnorm(1000)
rd <- rd_est(y ~ x | cov, t.design = "geq")
rd_sens_cutoff(rd, seq(-.5, .5, length.out = 10))



