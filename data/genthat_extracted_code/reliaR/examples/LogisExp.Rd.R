library(reliaR)


### Name: LogisExp
### Title: The Logistic-Exponential(LE) distribution
### Aliases: LogisExp dlogis.exp plogis.exp qlogis.exp rlogis.exp
### Keywords: distribution

### ** Examples

## Load data sets
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 2.36754, lambda.est = 0.01059
dlogis.exp(bearings, 2.36754, 0.01059, log = FALSE)
plogis.exp(bearings, 2.36754, 0.01059, lower.tail = TRUE, log.p = FALSE)
qlogis.exp(0.25, 2.36754, 0.01059, lower.tail=TRUE, log.p = FALSE)
rlogis.exp(30, 2.36754, 0.01059)



