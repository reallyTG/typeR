library(ReIns)


### Name: trProb
### Title: Estimator of small exceedance probabilities using truncated Hill
### Aliases: trProb

### ** Examples

# Sample from truncated Pareto distribution.
# truncated at 99% quantile
shape <- 2
X <- rtpareto(n=1000, shape=shape, endpoint=qpareto(0.99, shape=shape))

# Truncated Hill estimator
trh <- trHill(X, plot=TRUE, ylim=c(0,2))

# Small probability
trProb(X, gamma=trh$gamma, q=8, plot=TRUE)



