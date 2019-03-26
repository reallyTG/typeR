library(reliaR)


### Name: ExpoWeibull
### Title: The Exponentiated Weibull(EW) distribution
### Aliases: ExpoWeibull dexpo.weibull pexpo.weibull qexpo.weibull
###   rexpo.weibull
### Keywords: distribution

### ** Examples

## Load data sets
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(stress)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est =1.026465, theta.est = 7.824943

dexpo.weibull(stress, 1.026465, 7.824943, log = FALSE)
pexpo.weibull(stress, 1.026465, 7.824943, lower.tail = TRUE, log.p = FALSE)
qexpo.weibull(0.25, 1.026465, 7.824943, lower.tail=TRUE, log.p = FALSE)
rexpo.weibull(30, 1.026465, 7.824943)



