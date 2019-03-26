library(miscor)


### Name: test.cor
### Title: Test for the product-moment correlation coefficient for H0: rho
###   = rho0
### Aliases: test.cor

### ** Examples

#--------------------------------------
# Two-sided test
# H0: rho == 0, H1: rho != 0
# r = 0.23, n = 60

test.cor(r = 0.23, n = 120)

#--------------------------------------
# Two-sided test
# H0: rho == 0.4, H1: rho != 0.4
# r = 0.55, n = 120

test.cor(r = 0.55, n = 120, rho0 = 0.4)

#--------------------------------------
# One-sided test
# H0: rho <= 0.4, H1: rho > 0.4

# Generate random data
dat <- sim.cor(100, rho = 0.4)

test.cor(dat$x, dat$y, rho0 = 0.4)



