library(miscor)


### Name: print.conf.cor
### Title: Print cor.conf
### Aliases: print.conf.cor

### ** Examples

#--------------------------------------
# Two-sided 95% Confidence Interval
# r = 0.55, n = 120

obj <- conf.cor(r = 0.55, n = 120, output = FALSE)
print(obj)

#--------------------------------------
# One-sided 99% Confidence Interval

# Generate random data
dat <- sim.cor(100, rho = 0.4)

obj <- conf.cor(dat$x, dat$y, conf.level = 0.99, alternative = "less",
               output = FALSE)
print(obj)



