library(lestat)


### Name: difference
### Title: Create Object Representing Difference Between Two Distributions
### Aliases: difference difference.default difference.normal
###   difference.tdistribution

### ** Examples

data1 <- simulate(normal(8, log(1.5)), 6)
posterior1 <- marginal(linearmodel(data1, designOneGroup(6)), 1)
data2 <- simulate(normal(10, log(2.8)), 7)
posterior2 <- marginal(linearmodel(data2, designOneGroup(7)), 1)
posterior <- difference(posterior1, posterior2)
credibilityinterval(posterior)



