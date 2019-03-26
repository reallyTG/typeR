library(ReIns)


### Name: trEndpoint
### Title: Estimator of endpoint
### Aliases: trEndpoint

### ** Examples

# Sample from truncated Pareto distribution.
# truncated at 99% quantile
shape <- 2
X <- rtpareto(n=1000, shape=shape, endpoint=qpareto(0.99, shape=shape))

# Truncated Hill estimator
trh <- trHill(X, plot=TRUE, ylim=c(0,2))

# Endpoint
trEndpoint(X, gamma=trh$gamma, plot=TRUE, ylim=c(8,12))
abline(h=qpareto(0.99, shape=shape), lty=2)



