library(statGraph)


### Name: anogva
### Title: ANOGVA Analysis Of Graph Variability
### Aliases: anogva
### Keywords: analysis_of_graph_variability

### ** Examples


require(igraph)
g1 <- g2 <- g3 <- list()
for (i in 1:20) {
   G1 <- erdos.renyi.game(50, 0.50)
   g1[[i]] <- get.adjacency(G1)
   G2 <- erdos.renyi.game(50, 0.50)
   g2[[i]] <- get.adjacency(G2)
   G3 <- erdos.renyi.game(50, 0.52)
   g3[[i]] <- get.adjacency(G3)
}
g <- c(g1, g2, g3)
label <- c(rep(1,20),rep(2,20),rep(3,20))
result <- anogva(g, label, numBoot=50)
result




