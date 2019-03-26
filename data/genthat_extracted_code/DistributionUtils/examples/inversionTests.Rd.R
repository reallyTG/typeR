library(DistributionUtils)


### Name: inversionTests
### Title: Inversion Tests for Distributions
### Aliases: inversionTestpq inversionTestqp
### Keywords: distribution univariate

### ** Examples

## Default distribution is normal
inversionTestpq()
inversionTestqp()
## Supply parameters
inversionTestpq(mean = 1, sd = 2)
inversionTestqp(mean = 1, sd = 2)
## Gamma distribution, must specify shape
inversionTestpq("gamma", shape = 1)
inversionTestqp("gamma", shape = 1)



