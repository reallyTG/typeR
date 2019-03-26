library(alakazam)


### Name: getPathLengths
### Title: Calculate path lengths from the tree root
### Aliases: getPathLengths

### ** Examples

# Define example graph
graph <- ExampleTrees[[24]]

# Consider all nodes
getPathLengths(graph, root="Germline")

# Exclude nodes without an isotype annotation from step count
getPathLengths(graph, root="Germline", field="ISOTYPE", exclude=NA)




