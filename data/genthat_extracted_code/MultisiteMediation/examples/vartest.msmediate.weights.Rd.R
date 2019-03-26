library(MultisiteMediation)


### Name: vartest.msmediate.weights
### Title: Variance testing for multisite causal mediation analysis in the
###   presence of complex sample and survey designs and non-random
###   nonresponse
### Aliases: vartest.msmediate.weights

### ** Examples

data(sim.weights)

vartest.msmediate.weights(data = sim.weights, y = "y", treatment = "tr", 
    mediator = "me", response = "R", XR1 = c("x1", "x2", "x3"), XR0 = c("x1", 
        "x2", "x3"), XM1 = c("x1", "x2", "x3"), XM0 = c("x1", "x2", "x3"), 
    site = "site", sample.weight = "WD", npermute = 2)




