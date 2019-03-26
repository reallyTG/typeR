library(SimInf)


### Name: indegree
### Title: Determine in-degree for each node in a model
### Aliases: indegree

### ** Examples

## Create an 'SIR' model with 1600 nodes and initialize
## it with example data.
model <- SIR(u0 = u0_SIR(), tspan = 1:1460, events = events_SIR(),
             beta   = 0.16, gamma  = 0.077)

## Display indegree for each node in the model.
plot(indegree(model))



