library(modMax)


### Name: geneticAlgorithm
### Title: Genetic algorithm
### Aliases: geneticAlgorithm
### Keywords: Network structure Modularity Genetic algorithm Small-world
###   phenomena

### ** Examples

#unweighted network
randomgraph <- erdos.renyi.game(10, 0.3, type="gnp",directed = FALSE, loops = FALSE)

#to ensure that the graph is connected
vertices <- which(clusters(randomgraph)$membership==1)  
graph <- induced.subgraph(randomgraph,vertices)

adj <- get.adjacency(graph)
result <- geneticAlgorithm(adj, p=4, g=6)




