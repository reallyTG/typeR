library(graphon)


### Name: gmodel.ER
### Title: Observations from Erdos-Renyi random graph model
### Aliases: gmodel.ER

### ** Examples

## Generate a graph of 100 nodes with a fixed number of edges
graph1 = gmodel.ER(100,mode='num',par=100)
image(graph1)

## Generate 3 graphs with a global with probability 0.5
graph2 = gmodel.ER(100,par=0.5,rep=3)

par(mfrow=c(1,3))
image(graph2[[1]])
image(graph2[[2]])
image(graph2[[3]])




