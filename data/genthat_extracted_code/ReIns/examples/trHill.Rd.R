library(ReIns)


### Name: trHill
### Title: Hill estimator for upper truncated data
### Aliases: trHill

### ** Examples

# Sample from truncated Pareto distribution.
# truncated at 99% quantile
shape <- 2
X <- rtpareto(n=1000, shape=shape, endpoint=qpareto(0.99, shape=shape))

# Truncated Hill estimator
trh <- trHill(X, plot=TRUE, ylim=c(0,2))



