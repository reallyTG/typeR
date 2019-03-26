library(tsxtreme)


### Name: thetaruns
### Title: Runs estimator
### Aliases: thetaruns
### Keywords: models ts nonparametric

### ** Examples

## generate data from an AR(1)
## with Gaussian marginal distribution
n   <- 10000
dep <- 0.5
ar    <- numeric(n)
ar[1] <- rnorm(1)
for(i in 2:n)
  ar[i] <- rnorm(1, mean=dep*ar[i-1], sd=1-dep^2)
## transform to Laplace scale
ar <- qlapl(pnorm(ar))
## compute empirical estimate
theta <- thetaruns(ts=ar, u.mar=.95, probs=c(.95,.98,.99))
## output
plot(theta, ylim=c(.2,1))
abline(h=1, lty="dotted")



