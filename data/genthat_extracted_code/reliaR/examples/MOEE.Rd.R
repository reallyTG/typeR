library(reliaR)


### Name: MOEE
### Title: The Marshall-Olkin Extended Exponential (MOEE) distribution
### Aliases: MOEE dmoee pmoee qmoee rmoee
### Keywords: distribution

### ** Examples

## Load data sets
data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 75.67982, lambda.est = 1.67576
dmoee(stress, 75.67982, 1.67576, log = FALSE)
pmoee(stress, 75.67982, 1.67576, lower.tail = TRUE, 
    log.p = FALSE)
qmoee(0.25, 0.4, 2.0, lower.tail = TRUE, log.p = FALSE)
rmoee(10, 75.67982, 1.67576)



