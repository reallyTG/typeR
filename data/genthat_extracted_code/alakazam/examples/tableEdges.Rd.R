library(alakazam)


### Name: tableEdges
### Title: Tabulate the number of edges between annotations within a
###   lineage tree
### Aliases: tableEdges

### ** Examples

# Define example graph
graph <- ExampleTrees[[23]]

# Count direct edges between isotypes including inferred nodes
tableEdges(graph, "ISOTYPE")

# Count direct edges excluding edges to and from germline and inferred nodes
tableEdges(graph, "ISOTYPE", exclude=c("Germline", NA))

# Count indirect edges walking through germline and inferred nodes
tableEdges(graph, "ISOTYPE", indirect=TRUE, exclude=c("Germline", NA))




