library(modMax)


### Name: extremalOptimization
### Title: Extremal optimization (EO) algorithms
### Aliases: extremalOptimization pcseoss
### Keywords: Extremal Optimization Community Modularity Random Local
###   Search Agent Social Networks PCSEO-SS algorithm Community structure
###   Conflict pairwise constraints large-scale network

### ** Examples


#weighted network
randomgraph <- erdos.renyi.game(10, 0.3, type="gnp",directed = FALSE, loops = FALSE)

#to ensure that the graph is connected
vertices <- which(clusters(randomgraph)$membership==1)  
graph <- induced.subgraph(randomgraph,vertices)
graph <- set.edge.attribute(graph, "weight", value=runif(ecount(graph),0,1))

adj <- get.adjacency(graph, attr="weight")
result <- extremalOptimization(adj)



