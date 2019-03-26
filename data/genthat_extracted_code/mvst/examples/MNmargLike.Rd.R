library(mvst)


### Name: MNmargLike
### Title: Marginal Likelihood for the Multivariate Normal Model.
### Aliases: MNmargLike

### ** Examples

# Generate Normally distributed data
require(mvtnorm)
y = rmvnorm(100, rep(2,2), diag(2))
# Marginal likelihood (exact value)
MNmargLike(y, X=NULL, LOG=TRUE)



