library(lestat)


### Name: p.value
### Title: Compute the p-value for a Distribution
### Aliases: p.value p.value.default p.value.expgamma p.value.fdistribution
###   p.value.gammadistribution p.value.mnormal p.value.mtdistribution
###   p.value.normal p.value.tdistribution

### ** Examples

data <- simulate(normal(3, log(2)), 10)
posterior <- linearmodel(data, designOneGroup(10))
p.value(marginal(posterior, 1))



