library(SimInf)


### Name: outdegree
### Title: Determine out-degree for each node in a model
### Aliases: outdegree

### ** Examples

## Create an 'SIR' model with 1600 nodes and initialize
## it with example data.
model <- SIR(u0 = u0_SIR(), tspan = 1:1460, events = events_SIR(),
             beta   = 0.16, gamma  = 0.077)

## Display outdegree for each node in the model.
plot(outdegree(model))



