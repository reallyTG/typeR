library(JointNets)


### Name: returngraph.simulation
### Title: return igraph object from simulation result specified by user
###   input
### Aliases: returngraph.simulation

### ** Examples

library(JointNets)
data(exampleData)
result = simulation(n=c(100,100,100))$simulatedgraphs
graph = returngraph(result)



