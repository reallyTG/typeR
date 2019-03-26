library(netrankr)


### Name: indirect_relations
### Title: Indirect relations in a network
### Aliases: indirect_relations

### ** Examples

library(igraph)
g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))

#shortest path distances
D <- indirect_relations(g,type = "dist_sp")

#inverted shortest path distances
D <- indirect_relations(g,type = "dist_sp", FUN = dist_inv)
#shortes path dependencies (used for betweenness)
D <- indirect_relations(g,type = "depend_sp")

#walks attenuated exponentially by their length
W <- indirect_relations(g,type = "walks",FUN = walks_exp)




