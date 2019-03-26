library(MultisiteMediation)


### Name: msmediate.weights
### Title: Causal mediation analysis in multisite trials in the presence of
###   complex sample and survey designs and non-random nonresponse
### Aliases: msmediate.weights

### ** Examples

data(sim.weights)

msmediate.weights(data = sim.weights, y = "y", treatment = "tr", mediator = "me", 
    response = "R", XR1 = c("x1", "x2", "x3"), XR0 = c("x1", "x2", "x3"), XM1 = c("x1", 
        "x2", "x3"), XM0 = c("x1", "x2", "x3"), site = "site", sample.weight = "WD")



