library(tsxtreme)


### Name: theta2fit
### Title: Fit time series extremes
### Aliases: theta2fit
### Keywords: models ts nonparametric multivariate

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
fit <- theta2fit(ts=ar, u.mar=0.95, u.dep=0.98)

## plot theta(x,1)
plot(fit)
abline(h=1, lty="dotted")



