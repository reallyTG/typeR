library(idr)


### Name: d.binormal
### Title: Log density of bivariate Gaussian distribution with symmetric
###   marginals
### Aliases: d.binormal
### Keywords: internal

### ** Examples


z.1 <- rnorm(500, 3, 1)
rho <- 0.8

## The component with higher values is correlated with correlation coefficient=0.8 
z.2 <- rnorm(500, 3 + 0.8*(z.1-3), (1-rho^2))
mu <- 3
sigma <- 1
den.z <- d.binormal(z.1, z.2, mu, sigma, rho)

den.z



