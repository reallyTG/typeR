library(reliaR)


### Name: InvGenExp
### Title: The Inverse Generalized Exponential(IGE) distribution
### Aliases: InvGenExp dinv.genexp pinv.genexp qinv.genexp rinv.genexp
### Keywords: distribution

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(repairtimes)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.097807, lambda.est = 1.206889
dinv.genexp(repairtimes, 1.097807, 1.206889, log = FALSE)
pinv.genexp(repairtimes, 1.097807, 1.206889, lower.tail = TRUE, log.p = FALSE)
qinv.genexp(0.25, 1.097807, 1.206889, lower.tail=TRUE, log.p = FALSE)
rinv.genexp(30, 1.097807, 1.206889)



