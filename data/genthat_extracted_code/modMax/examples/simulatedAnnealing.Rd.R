library(modMax)


### Name: simulatedAnnealing
### Title: Simulated annealing algorithms
### Aliases: simulatedAnnealing saIndividualCollectiveMoves
### Keywords: Networks Communality Betweenness

### ** Examples


#unweighted network
randomgraph <- erdos.renyi.game(10, 0.3, type="gnp",directed = FALSE, loops = FALSE)

#to ensure that the graph is connected
vertices <- which(clusters(randomgraph)$membership==1)  
graph <- induced.subgraph(randomgraph,vertices)

adj <- get.adjacency(graph)
result <- simulatedAnnealing(adj, fixed=10)




