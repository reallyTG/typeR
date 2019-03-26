library(modMax)


### Name: spectralOptimization
### Title: Spectral optimization algorithms
### Aliases: spectralOptimization multiWay spectral1 spectral2
### Keywords: Clustering Partitioning Modules Metabolic network Social
###   network Complex networks Community structure Eigenspectrum Modularity
###   matrix Vector partition approach

### ** Examples

#unweighted network
randomgraph1 <- erdos.renyi.game(10, 0.3, type="gnp",directed = FALSE, loops = FALSE)

#to ensure that the graph is connected
vertices1 <- which(clusters(randomgraph1)$membership==1)  
graph1 <- induced.subgraph(randomgraph1,vertices1)

adj1 <- get.adjacency(graph1)
result1 <- spectralOptimization(adj1, refine = TRUE)

#weighted network
randomgraph2 <- erdos.renyi.game(10, 0.3, type="gnp",directed = FALSE, loops = FALSE)

#to ensure that the graph is connected
vertices2 <- which(clusters(randomgraph2)$membership==1)  
graph2 <- induced.subgraph(randomgraph2,vertices2)
graph2 <- set.edge.attribute(graph2, "weight", value=runif(ecount(graph2),0,1))

adj2 <- get.adjacency(graph2, attr="weight")
result2 <- multiWay(adj2, maxComm=3)



