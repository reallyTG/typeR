library(reliaR)


### Name: LogisRayleigh
### Title: The Logistic-Rayleigh(LR) distribution
### Aliases: LogisRayleigh dlogis.rayleigh plogis.rayleigh qlogis.rayleigh
###   rlogis.rayleigh
### Keywords: distribution

### ** Examples

## Load data sets
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.4779388, lambda.est = 0.2141343
dlogis.rayleigh(stress, 1.4779388, 0.2141343, log = FALSE)
plogis.rayleigh(stress, 1.4779388, 0.2141343, lower.tail = TRUE, log.p = FALSE)
qlogis.rayleigh(0.25, 1.4779388, 0.2141343, lower.tail=TRUE, log.p = FALSE)
rlogis.rayleigh(30, 1.4779388, 0.2141343)



