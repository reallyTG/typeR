library(netrankr)


### Name: positional_dominance
### Title: Generalized Dominance in Graphs
### Aliases: positional_dominance

### ** Examples

library(igraph)

g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
P<-neighborhood_inclusion(g)
comparable_pairs(P)

# positional dominance under total heterogeneity
dist <- indirect_relations(g,type = "dist_sp")
D <- positional_dominance(dist,map = FALSE,benefit = FALSE) 
comparable_pairs(D) 

# positional dominance under total homogeneity
D_map <- positional_dominance(dist,map = TRUE,benefit = FALSE) 
comparable_pairs(D_map) #more comparables than D




