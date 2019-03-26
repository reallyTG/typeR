library(igraph)


### Name: knn
### Title: Average nearest neighbor degree
### Aliases: knn graph.knn
### Keywords: graphs

### ** Examples


# Some trivial ones
g <- make_ring(10)
knn(g)
g2 <- make_star(10)
knn(g2)

# A scale-free one, try to plot 'knnk'
g3 <- sample_pa(1000, m=5)
knn(g3)

# A random graph
g4 <- sample_gnp(1000, p=5/1000)
knn(g4)

# A weighted graph
g5 <- make_star(10)
E(g5)$weight <- seq(ecount(g5))
knn(g5)



