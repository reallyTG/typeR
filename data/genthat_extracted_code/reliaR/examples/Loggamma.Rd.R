library(reliaR)


### Name: Loggamma
### Title: The log-gamma(LG) distribution
### Aliases: Loggamma dlog.gamma plog.gamma qlog.gamma rlog.gamma
### Keywords: distribution

### ** Examples

## Load data sets
data(conductors)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(conductors)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 0.0088741, lambda.est = 0.6059935
dlog.gamma(conductors, 0.0088741, 0.6059935, log = FALSE)
plog.gamma(conductors, 0.0088741, 0.6059935, lower.tail = TRUE, log.p = FALSE)
qlog.gamma(0.25, 0.0088741, 0.6059935, lower.tail=TRUE, log.p = FALSE)
rlog.gamma(30, 0.0088741, 0.6059935)



