library(MultisiteMediation)


### Name: vartest.msmediate
### Title: Variance testing for multisite causal mediation analysis
### Aliases: vartest.msmediate

### ** Examples

data(sim)

vartest.msmediate(data = sim, y = "y", treatment = "tr", mediator = "me", X = c("x1", 
    "x2", "x3", "x4"), site = "site", npermute = 2)




