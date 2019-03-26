library(idr)


### Name: e.step.2normal
### Title: E-step for parameterized bivariate 2-component Gaussian mixture
###   models
### Aliases: e.step.2normal
### Keywords: internal

### ** Examples


z.1 <- c(rnorm(500, 0, 1), rnorm(500, 3, 1))
rho <- 0.8

## The component with higher values is correlated with correlation coefficient=0.8 
z.2 <- c(rnorm(500, 0, 1), rnorm(500, 3 + 0.8*(z.1[501:1000]-3), (1-rho^2)))

## Starting values
mu0 <- 3
sigma0 <- 1
rho0 <- 0.85
p0 <- 0.55

e.z <- e.step.2normal(z.1, z.2, mu0, sigma0, rho0, p0)



