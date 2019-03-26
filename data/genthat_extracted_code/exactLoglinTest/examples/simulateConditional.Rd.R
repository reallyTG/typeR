library(exactLoglinTest)


### Name: simulateConditional
### Title: Simulates from the conditional distribution of a log-linear
###   model
### Aliases: simulateConditional simtable.bab simtable.cab
### Keywords: htest

### ** Examples

data(czech.dat)
chain2 <- simulateConditional(y ~ (A + B + C + D + E + F) ^ 2,
                               data = czech.dat,
                               method = "cab",
                               nosim = 10 ^ 3,
                               p = .4,
                               dens = function(y) 0)



