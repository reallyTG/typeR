library(miscor)


### Name: conf.cor
### Title: Product-moment correlation coefficient with confidence interval
### Aliases: conf.cor

### ** Examples

#--------------------------------------
# Two-sided 95% Confidence Interval
# r = 0.55, n = 120

conf.cor(r = 0.55, n = 120)

#--------------------------------------
# One-sided 99% Confidence Interval

# Generate random data
dat <- sim.cor(100, rho = 0.4)

conf.cor(dat$x, dat$y, conf.level = 0.99, alternative = "less")



