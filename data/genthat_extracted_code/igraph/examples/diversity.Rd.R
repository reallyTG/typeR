library(igraph)


### Name: diversity
### Title: Graph diversity
### Aliases: diversity graph.diversity
### Keywords: graphs

### ** Examples


g1 <- sample_gnp(20, 2/20)
g2 <- sample_gnp(20, 2/20)
g3 <- sample_gnp(20, 5/20)
E(g1)$weight <- 1
E(g2)$weight <- runif(ecount(g2))
E(g3)$weight <- runif(ecount(g3))
diversity(g1)
diversity(g2)
diversity(g3)



