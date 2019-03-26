library(igraph)


### Name: is_dag
### Title: Directed acyclic graphs
### Aliases: is_dag is.dag
### Keywords: graphs

### ** Examples


g <- make_tree(10)
is_dag(g)
g2 <- g + edge(5,1)
is_dag(g2)



