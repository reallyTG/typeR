library(SimInf)


### Name: Nn
### Title: Extract number of nodes in a model
### Aliases: Nn

### ** Examples

## Create an 'SIR' model with 100 nodes, with 99 susceptible,
## 1 infected and 0 recovered in each node.
u0 <- data.frame(S = rep(99, 100), I = rep(1, 100), R = rep(0, 100))
model <- SIR(u0 = u0, tspan = 1:10, beta = 0.16, gamma = 0.077)

## Display the number of nodes in the model.
Nn(model)



