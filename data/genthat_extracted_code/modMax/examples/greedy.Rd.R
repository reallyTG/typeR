library(modMax)


### Name: greedy
### Title: Greedy algorithms
### Aliases: greedy rgplus msgvm cd louvain vertexSim mome
### Keywords: Analysis of algorithms Network dynamics Social network
###   Network theory Community discovery Graph clustering Modularity
###   Multilevel Community structure rural-urban migration Community
###   analysis Clustering Social networking service Community detection
###   Randomized algorithm Random graphs Networks Critical phenomena of
###   socio-economic systems Socio-economic networks

### ** Examples

#unweighted network
randomgraph1 <- erdos.renyi.game(10, 0.3, type="gnp",directed = FALSE, loops = FALSE)

#to ensure that the graph is connected
vertices1 <- which(clusters(randomgraph1)$membership==1)  
graph1 <- induced.subgraph(randomgraph1,vertices1)

adj1 <- get.adjacency(graph1)
result1 <- greedy(adj1, refine = "fast")

#weighted network
randomgraph2 <- erdos.renyi.game(10, 0.3, type="gnp",directed = FALSE, loops = FALSE)

#to ensure that the graph is connected
vertices2 <- which(clusters(randomgraph2)$membership==1)  
graph2 <- induced.subgraph(randomgraph2,vertices2)
graph2 <- set.edge.attribute(graph2, "weight", value=runif(ecount(graph2),0,1))

adj2 <- get.adjacency(graph2, attr="weight")
result2 <- louvain(adj2)



