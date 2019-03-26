library(ReIns)


### Name: trQuant
### Title: Estimator of large quantiles using truncated Hill
### Aliases: trQuant trQuantW

### ** Examples

# Sample from truncated Pareto distribution.
# truncated at 99% quantile
shape <- 2
X <- rtpareto(n=1000, shape=shape, endpoint=qpareto(0.99, shape=shape))

# Truncated Hill estimator
trh <- trHill(X, plot=TRUE, ylim=c(0,2))

# Truncation odds
dt <- trDT(X, gamma=trh$gamma, plot=TRUE, ylim=c(0,2))

# Large quantile
p <- 10^(-5)
# Truncated distribution
trQuant(X, gamma=trh$gamma, DT=dt$DT, p=p, plot=TRUE)
# Original distribution
trQuantW(X, gamma=trh$gamma, DT=dt$DT, p=p, plot=TRUE, ylim=c(0,1000))




