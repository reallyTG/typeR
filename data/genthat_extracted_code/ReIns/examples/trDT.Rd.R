library(ReIns)


### Name: trDT
### Title: Truncation odds
### Aliases: trDT

### ** Examples

# Sample from truncated Pareto distribution.
# truncated at 99% quantile
shape <- 2
X <- rtpareto(n=1000, shape=shape, endpoint=qpareto(0.99, shape=shape))

# Truncated Hill estimator
trh <- trHill(X, plot=TRUE, ylim=c(0,2))

# Truncation odds
dt <- trDT(X, gamma=trh$gamma, plot=TRUE, ylim=c(0,0.05))



