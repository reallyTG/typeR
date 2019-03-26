library(nimble)


### Name: setAndCalculate
### Title: Creates a nimbleFunction for setting the values of one or more
###   model nodes, calculating the associated deterministic dependents and
###   logProb values, and returning the total sum log-probability.
### Aliases: setAndCalculate setAndCalculateDiff

### ** Examples

code <- nimbleCode({ for(i in 1:3) { x[i] ~ dnorm(0,1); y[i] ~ dnorm(0, 1)}})
Rmodel <- nimbleModel(code)
my_setAndCalc <- setAndCalculate(Rmodel, c('x[1]', 'x[2]', 'y[1]', 'y[2]'))
lp <- my_setAndCalc$run(c(1.2, 1.4, 7.6, 8.9))



