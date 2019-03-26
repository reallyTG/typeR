library(alakazam)


### Name: getMRCA
### Title: Retrieve the first non-root node of a lineage tree
### Aliases: getMRCA

### ** Examples

# Define example graph
graph <- ExampleTrees[[23]]

# Use unweighted path length and do not exclude any nodes
getMRCA(graph, path="steps", root="Germline")

# Exclude nodes without an isotype annotation and use weighted path length
getMRCA(graph, path="distance", root="Germline", field="ISOTYPE", exclude=NA)




