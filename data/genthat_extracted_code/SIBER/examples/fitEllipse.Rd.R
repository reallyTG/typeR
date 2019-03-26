library(SIBER)


### Name: fitEllipse
### Title: Fit a multivariate normal distribution to x and y data using
###   jags
### Aliases: fitEllipse

### ** Examples

x <- stats::rnorm(50)
y <- stats::rnorm(50)
parms <- list()
parms$n.iter <- 2 * 10^3
parms$n.burnin <- 500
parms$n.thin <- 2     
parms$n.chains <- 2    
priors <- list()
priors$R <- 1 * diag(2)
priors$k <- 2
priors$tau.mu <- 1.0E-3
fitEllipse(x, y, parms, priors)




