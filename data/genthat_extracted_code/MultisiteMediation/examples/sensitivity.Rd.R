library(MultisiteMediation)


### Name: sensitivity
### Title: Sensitivity analysis for causal mediation analysis in multisite
###   trials
### Aliases: sensitivity

### ** Examples

data(sim.weights)

sensitivity(data = sim.weights, y = "y", treatment = "tr", mediator = "me", 
    response = "R", XR1 = "x2", XR0 = "x2", XM1 = c("x1", "x2"), XM0 = "x2", 
    omit.X = c("x1", "x3"), ran.omit.X = "x2", site = "site")



