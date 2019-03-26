library(netrankr)


### Name: hyperbolic_index
### Title: Hyperbolic (centrality) index
### Aliases: hyperbolic_index

### ** Examples


library(igraph)

g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
hyperbolic_index(g,type = "odd")
hyperbolic_index(g,type = "even")



