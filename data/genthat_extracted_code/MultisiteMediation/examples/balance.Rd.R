library(MultisiteMediation)


### Name: balance
### Title: Balance checking for causal mediation analysis in multisite
###   trials
### Aliases: balance

### ** Examples

data(sim.weights)

balance(data = sim.weights, y = "y", treatment = "tr", mediator = "me", response = "R", 
    XR1 = c("x1", "x2", "x3"), XR0 = c("x1", "x2", "x3"), XM1 = c("x1", "x2", "x3"), 
    XM0 = c("x1", "x2", "x3"), X = c("x1", "x2", "x3"), site = "site")



