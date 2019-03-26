library(miscor)


### Name: par.cor
### Title: Partial and semipartial correlation
### Aliases: par.cor

### ** Examples

dat <- data.frame(x = c(4, 6, 8, 8, 9, 4),
                  y = c(3, 7, 9, 8, 9, 3),
                  z = c(1, 3, 4, 4, 5, 2))

#--------------------------------------
# Partial correlation

par.cor(dat$x, dat$y, p.xy = dat$z)

#--------------------------------------
# Semipartial correlation
# remove z from x

par.cor(dat$x, dat$y, p.x = dat$z)

#--------------------------------------
# Semipartial correlation
# remove z from y

par.cor(dat$x, dat$y, p.y = dat$y)

#--------------------------------------
# Partial correlation: Two-sided test
# H0: rho.p == 0, H1: rho.p != 0

par.cor(dat$x, dat$y, p.xy = dat$z, sig = TRUE)

#--------------------------------------
# Partial correlation: One-sided test
# H0: rho.p <= 0.2, H1: rho.p > 0.2

par.cor(dat$x, dat$y, p.xy = dat$z, sig = TRUE,
        rho0 = 0.4, alternative = "less")



