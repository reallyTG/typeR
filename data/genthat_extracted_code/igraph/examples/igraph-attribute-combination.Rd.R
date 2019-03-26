library(igraph)


### Name: igraph-attribute-combination
### Title: How igraph functions handle attributes when the graph changes
### Aliases: igraph-attribute-combination attribute.combination
### Keywords: graphs

### ** Examples


g <- graph( c(1,2, 1,2, 1,2, 2,3, 3,4) )
E(g)$weight <- 1:5

## print attribute values with the graph
igraph_options(print.graph.attributes=TRUE)
igraph_options(print.vertex.attributes=TRUE)
igraph_options(print.edge.attributes=TRUE)

## new attribute is the sum of the old ones
simplify(g, edge.attr.comb="sum")

## collect attributes into a string
simplify(g, edge.attr.comb=toString)

## concatenate them into a vector, this creates a complex
## attribute
simplify(g, edge.attr.comb="concat")

E(g)$name <- letters[seq_len(ecount(g))]

## both attributes are collected into strings
simplify(g, edge.attr.comb=toString)

## harmonic average of weights, names are dropped
simplify(g, edge.attr.comb=list(weight=function(x) length(x)/sum(1/x),
                                name="ignore"))



