library(igraph)


### Name: degree
### Title: Degree and degree distribution of the vertices
### Aliases: degree degree.distribution degree_distribution
###   degree_distribution
### Keywords: graphs

### ** Examples


g <- make_ring(10)
degree(g)
g2 <- sample_gnp(1000, 10/1000)
degree_distribution(g2)




