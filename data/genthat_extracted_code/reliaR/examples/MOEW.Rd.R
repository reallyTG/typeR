library(reliaR)


### Name: MOEW
### Title: The Marshall-Olkin Extended Weibull (MOEW) distribution
### Aliases: MOEW dmoew pmoew qmoew rmoew
### Keywords: distribution

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.3035937,  lambda.est = 279.2177754

dmoew(sys2, 0.3035937, 279.2177754, log = FALSE)
pmoew(sys2, 0.3035937, 279.2177754, lower.tail = TRUE, log.p = FALSE)
qmoew(0.25, 0.3035937, 279.2177754, lower.tail=TRUE, log.p = FALSE)
rmoew(50, 0.3035937, 279.2177754)



