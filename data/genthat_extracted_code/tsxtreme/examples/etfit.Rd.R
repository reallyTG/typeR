library(tsxtreme)


### Name: depmeasures
### Title: Estimate dependence measures
### Aliases: depmeasures thetafit chifit
### Keywords: models iteration multivariate ts nonparametric

### ** Examples

## generate data from an AR(1)
## with Gaussian marginal distribution
n   <- 10000
dep <- 0.5
ar    <- numeric(n)
ar[1] <- rnorm(1)
for(i in 2:n)
  ar[i] <- rnorm(1, mean=dep*ar[i-1], sd=1-dep^2)
plot(ar, type="l")
plot(density(ar))
grid <- seq(-3,3,0.01)
lines(grid, dnorm(grid), col="blue")

## rescale the margin (focus on dependence)
ar <- qlapl(pnorm(ar))

## fit the data
params <- bayesparams()
params$maxit <- 100 # bigger numbers would be
params$burn  <- 10  # more sensible...
params$thin  <- 4
theta <- thetafit(ts=ar, R=500, S=100, u.mar=0.95, u.dep=0.98,
                  probs = c(0.98, 0.999), par=params)
## or, same thing in two steps to control fit output before computing theta:
fit <- depfit(ts=ar, u.mar=0.95, u.dep=0.98, par=params)
plot(fit)
theta <- thetafit(ts=ar, R=500, S=100, u.mar=0.95, u.dep=0.98,
                  probs = c(0.98, 0.999), fit=FALSE, prev.fit=fit)



