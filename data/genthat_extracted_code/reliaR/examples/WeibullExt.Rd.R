library(reliaR)


### Name: WeibullExt
### Title: The Weibull Extension(WE) distribution
### Aliases: WeibullExt dweibull.ext pweibull.ext qweibull.ext rweibull.ext
### Keywords: distribution

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.00019114, beta.est = 0.14696242

dweibull.ext(sys2, 0.00019114, 0.14696242, log = FALSE)
pweibull.ext(sys2, 0.00019114, 0.14696242, lower.tail = TRUE, log.p = FALSE)
qweibull.ext(0.25, 0.00019114, 0.14696242, lower.tail=TRUE, log.p = FALSE)
rweibull.ext(30, 0.00019114, 0.14696242)



