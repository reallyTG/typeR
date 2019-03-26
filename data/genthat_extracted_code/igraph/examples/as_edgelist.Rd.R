library(igraph)


### Name: as_edgelist
### Title: Convert a graph to an edge list
### Aliases: as_edgelist get.edgelist
### Keywords: graphs

### ** Examples


g <- sample_gnp(10, 2/10)
as_edgelist(g)

V(g)$name <- LETTERS[seq_len(gorder(g))]
as_edgelist(g)




