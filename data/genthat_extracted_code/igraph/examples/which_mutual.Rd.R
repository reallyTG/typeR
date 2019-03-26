library(igraph)


### Name: which_mutual
### Title: Find mutual edges in a directed graph
### Aliases: which_mutual is.mutual
### Keywords: graphs

### ** Examples


g <- sample_gnm(10, 50, directed=TRUE)
reciprocity(g)
dyad_census(g)
which_mutual(g)
sum(which_mutual(g))/2 == dyad_census(g)$mut



