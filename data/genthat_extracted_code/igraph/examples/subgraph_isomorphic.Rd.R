library(igraph)


### Name: subgraph_isomorphic
### Title: Decide if a graph is subgraph isomorphic to another one
### Aliases: subgraph_isomorphic graph.subisomorphic.vf2
###   graph.subisomorphic.lad is_subgraph_isomorphic_to

### ** Examples

# A LAD example
pattern <- make_graph(~ 1:2:3:4:5,
                      1 - 2:5, 2 - 1:5:3, 3 - 2:4, 4 - 3:5, 5 - 4:2:1)
target <- make_graph(~ 1:2:3:4:5:6:7:8:9,
                    1 - 2:5:7, 2 - 1:5:3, 3 - 2:4, 4 - 3:5:6:8:9,
                    5 - 1:2:4:6:7, 6 - 7:5:4:9, 7 - 1:5:6,
                    8 - 4:9, 9 - 6:4:8)
domains <- list(`1` = c(1,3,9), `2` = c(5,6,7,8), `3` = c(2,4,6,7,8,9),
                `4` = c(1,3,9), `5` = c(2,4,8,9))
subgraph_isomorphisms(pattern, target)
subgraph_isomorphisms(pattern, target, induced = TRUE)
subgraph_isomorphisms(pattern, target, domains = domains)

# Directed LAD example
pattern <- make_graph(~ 1:2:3, 1 -+ 2:3)
dring <- make_ring(10, directed = TRUE)
subgraph_isomorphic(pattern, dring)



