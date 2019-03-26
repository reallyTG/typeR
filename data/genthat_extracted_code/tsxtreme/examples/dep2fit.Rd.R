library(tsxtreme)


### Name: dep2fit
### Title: Dependence model fit (stepwise)
### Aliases: dep2fit
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

## rescale margin
ar <- qlapl(pnorm(ar))

## fit model without constraints...
fit1 <- dep2fit(ts=ar, u.mar = 0.95, u.dep=0.98, conditions=FALSE)
fit1$a; fit1$b

## ...and compare with a fit with constraints
fit2 <- dep2fit(ts=ar, u.mar = 0.95, u.dep=0.98, conditions=TRUE)
fit2$a; fit2$b# should be similar, as true parameters lie well within the constraints



