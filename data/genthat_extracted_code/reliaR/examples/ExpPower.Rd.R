library(reliaR)


### Name: ExpPower
### Title: The Exponential Power distribution
### Aliases: ExpPower dexp.power pexp.power qexp.power rexp.power
### Keywords: distribution

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.905868898, lambda.est =  0.001531423

dexp.power(sys2, 0.905868898, 0.001531423, log = FALSE)
pexp.power(sys2, 0.905868898, 0.001531423, lower.tail = TRUE, log.p = FALSE)
qexp.power(0.25, 0.905868898, 0.001531423, lower.tail=TRUE, log.p = FALSE)
rexp.power(30, 0.905868898, 0.001531423)



