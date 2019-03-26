library(idr)


### Name: loglik.2binormal
### Title: Compute log-likelihood of parameterized bivariate 2-component
###   Gaussian mixture models
### Aliases: loglik.2binormal
### Keywords: internal

### ** Examples

z.1 <- c(rnorm(500, 0, 1), rnorm(500, 3, 1))
rho <- 0.8

## The component with higher values is correlated with correlation coefficient=0.8 
z.2 <- c(rnorm(500, 0, 1), rnorm(500, 3 + 0.8*(z.1[501:1000]-3), (1-rho^2)))

## Starting values
mu <- 3
sigma <- 1
rho <- 0.85
p <- 0.55

## The function is currently defined as
loglik <- loglik.2binormal(z.1, z.2, mu, sigma, rho, p) 

loglik



