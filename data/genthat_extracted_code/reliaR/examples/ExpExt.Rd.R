library(reliaR)


### Name: ExpExt
### Title: The Exponential Extension(EE) distribution
### Aliases: ExpExt dexp.ext pexp.ext qexp.ext rexp.ext
### Keywords: distribution

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.0126e+01, lambda.est = 1.5848e-04
dexp.ext(sys2, 1.012556e+01, 1.5848e-04, log = FALSE)
pexp.ext(sys2, 1.012556e+01, 1.5848e-04, lower.tail = TRUE, log.p = FALSE)
qexp.ext(0.25, 1.012556e+01, 1.5848e-04, lower.tail=TRUE, log.p = FALSE)
rexp.ext(30, 1.012556e+01, 1.5848e-04)



