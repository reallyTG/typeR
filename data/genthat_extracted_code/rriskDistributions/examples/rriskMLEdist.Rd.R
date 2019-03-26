library(rriskDistributions)


### Name: rriskMLEdist
### Title: Maximum likelihood fitting of univariate distributions
### Aliases: rriskMLEdist
### Keywords: fitdistrplus

### ** Examples

## a basic fit of some distribution with maximum likelihood estimation
set.seed(1)
x2 <- rchisq(500, 4)
rriskMLEdist(x2, "norm")
rriskMLEdist(x2, "exp")
rriskMLEdist(x2, "lnorm")
rriskMLEdist(x2, "logis")
rriskMLEdist(x2, "gamma")
rriskMLEdist(x2, "weibull")
#rriskMLEdist(x2, "beta")
rriskMLEdist(x2, "chisq")
rriskMLEdist(x2, "t")
rriskMLEdist(x2, "f")
rriskMLEdist(x2, "cauchy")
rriskMLEdist(x2, "gompertz")

## produces an error:
# rriskMLEdist(x2, "triang")




