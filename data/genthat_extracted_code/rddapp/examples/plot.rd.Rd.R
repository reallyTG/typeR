library(rddapp)


### Name: plot.rd
### Title: Plot the Regression Discontinuity 'plot.rd' plots the
###   relationship between the running variable and the outcome. It is
###   based on the 'plot.RD' function in the 'rdd' package.
### Aliases: plot.rd

### ** Examples

 
dat <- data.frame(x = runif(1000, -1, 1), cov = rnorm(1000))
dat$tr <- as.integer(dat$x >= 0)
dat$y <- 3 + 2 * dat$x + 3 * dat$cov + 10 * (dat$x >= 0) + rnorm(1000)
rd <- rd_est(y ~ x + tr | cov, data = dat, cutpoint = 0, t.design = "geq") 
plot(rd)



