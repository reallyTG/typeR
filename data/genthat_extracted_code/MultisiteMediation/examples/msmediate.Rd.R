library(MultisiteMediation)


### Name: msmediate
### Title: Causal mediation analysis in multisite trials
### Aliases: msmediate

### ** Examples

data(sim)

msmediate(data = sim, y = "y", treatment = "tr", mediator = "me", X = c("x1", "x2", 
    "x3", "x4"), site = "site")



