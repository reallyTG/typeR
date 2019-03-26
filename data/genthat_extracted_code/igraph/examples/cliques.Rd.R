library(igraph)


### Name: cliques
### Title: The functions find cliques, ie. complete subgraphs in a graph
### Aliases: cliques largest_cliques maximal.cliques maximal.cliques.count
###   clique.number clique_num largest.cliques count_max_cliques
###   max_cliques max_cliques
### Keywords: graphs

### ** Examples


# this usually contains cliques of size six
g <- sample_gnp(100, 0.3)
clique_num(g)
cliques(g, min=6)
largest_cliques(g)

# To have a bit less maximal cliques, about 100-200 usually
g <- sample_gnp(100, 0.03)
max_cliques(g)





