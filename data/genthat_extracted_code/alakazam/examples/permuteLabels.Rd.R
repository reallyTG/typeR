library(alakazam)


### Name: permuteLabels
### Title: Permute the node labels of a tree
### Aliases: permuteLabels

### ** Examples

# Define and plot example graph
library(igraph)
graph <- ExampleTrees[[23]]
plot(graph, layout=layout_as_tree, vertex.label=V(graph)$ISOTYPE, 
     vertex.size=50, edge.arrow.mode=0, vertex.color="grey80")

# Permute annotations and plot new tree
g <- permuteLabels(graph, "ISOTYPE")
plot(g, layout=layout_as_tree, vertex.label=V(g)$ISOTYPE,
     vertex.size=50, edge.arrow.mode=0, vertex.color="grey80")




