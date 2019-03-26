library(nimble)


### Name: setAndCalculateOne
### Title: Creates a nimbleFunction for setting the value of a scalar model
###   node, calculating the associated deterministic dependents and logProb
###   values, and returning the total sum log-probability.
### Aliases: setAndCalculateOne

### ** Examples

code <- nimbleCode({ for(i in 1:3) x[i] ~ dnorm(0, 1) })
Rmodel <- nimbleModel(code)
my_setAndCalc <- setAndCalculateOne(Rmodel, 'x[1]')
lp <- my_setAndCalc$run(2)



