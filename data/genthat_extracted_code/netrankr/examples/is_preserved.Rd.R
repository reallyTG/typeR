library(netrankr)


### Name: is_preserved
### Title: Check preservation
### Aliases: is_preserved

### ** Examples


library(igraph)
# standard measures of centrality preserve the neighborhood inclusion preorder
g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
P<-neighborhood_inclusion(g)

is_preserved(P,degree(g))
is_preserved(P,betweenness(g))
is_preserved(P,closeness(g))



