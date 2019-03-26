library(miscor)


### Name: print.test.cor
### Title: Print cor.rhotest
### Aliases: print.test.cor

### ** Examples

#--------------------------------------
# Two-sided test
# H0: rho == 0, H1: rho != 0
# r = 0.23, n = 60

obj <- test.cor(r = 0.23, n = 120, output = FALSE)
print(obj)

#--------------------------------------
# Two-sided test
# H0: rho == 0.4, H1: rho != 0.4
# r = 0.55, n = 120

obj <- test.cor(r = 0.55, n = 120, rho0 = 0.4,
                output = FALSE)
print(obj)

#--------------------------------------
# One-sided test
# H0: rho <= 0.4, H1: rho > 0.4

# Generate random data
dat <- sim.cor(100, rho = 0.4)

obj <- test.cor(dat$x, dat$y, rho0 = 0.4, output = FALSE)
print(obj)



