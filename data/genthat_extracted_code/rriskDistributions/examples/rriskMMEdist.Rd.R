library(rriskDistributions)


### Name: rriskMMEdist
### Title: Fitting univariate distributions by matching moments
### Aliases: rriskMMEdist
### Keywords: fitdistrplus

### ** Examples

## Continuous distributions
set.seed(1)
x1 <- stats::rnorm(500, mean = 2, sd = 0.7)
rriskMMEdist(x1, "norm")
rriskMMEdist(x1, "exp")
rriskMMEdist(x1, "gamma")
rriskMMEdist(x1, "logis")
rriskMMEdist(x1, "unif")

## produces an error:
# rriskMMEdist(x1, "lnorm")
# rriskMMEdist(x1, "beta")

## Discrete distributions
set.seed(2)
x2 <- rpois(500, lambda = 3)
rriskMMEdist(x2, "pois")
rriskMMEdist(x2, "nbinom")
rriskMMEdist(x2, "geom")




