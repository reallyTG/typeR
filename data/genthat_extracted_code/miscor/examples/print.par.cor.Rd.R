library(miscor)


### Name: print.par.cor
### Title: Print par.cor
### Aliases: print.par.cor

### ** Examples

dat <- data.frame(x = c(4, 6, 8, 8, 9, 4),
                  y = c(3, 7, 9, 8, 9, 3),
                  z = c(1, 3, 4, 4, 5, 2))

#--------------------------------------
# Partial correlation

obj <- par.cor(dat$x, dat$y, p.xy = dat$z, output = FALSE)
print(obj)

#--------------------------------------
# Semipartial correlation
# remove z from x

obj <- par.cor(dat$x, dat$y, p.x = dat$z, output = FALSE)
print(obj)

#--------------------------------------
# Semipartial correlation
# remove z from y

obj <- par.cor(dat$x, dat$y, p.y = dat$y, output = FALSE)
print(obj)

#--------------------------------------
# Partial correlation: Two-sided test
# H0: rho.p == 0, H1: rho.p != 0

obj <- par.cor(dat$x, dat$y, p.xy = dat$z, sig = TRUE,
               output = FALSE)
print(obj)

#--------------------------------------
# Partial correlation: One-sided test
# H0: rho.p <= 0.2, H1: rho.p > 0.2

obj <- par.cor(dat$x, dat$y, p.xy = dat$z, sig = TRUE,
               rho0 = 0.4, alternative = "less", output = FALSE)
print(obj)



