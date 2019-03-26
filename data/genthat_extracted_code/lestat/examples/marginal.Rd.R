library(lestat)


### Name: marginal
### Title: A Marginal of a Multivariate Distribution
### Aliases: marginal marginal.default marginal.binomialbeta
###   marginal.mdiscretedistribution marginal.mnormalexpgamma
###   marginal.mnormalgamma marginal.mnormal marginal.mtdistribution
###   marginal.muniformdistribution marginal.normalexpgamma
###   marginal.normalgamma

### ** Examples

data <- simulate(normal(3, log(3)), 11)
posterior <- linearmodel(data, designOneGroup(11))
credibilityinterval(marginal(posterior, 1))
credibilityinterval(marginal(posterior, 2))



