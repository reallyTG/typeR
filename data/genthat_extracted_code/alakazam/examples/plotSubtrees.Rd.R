library(alakazam)


### Name: plotSubtrees
### Title: Plots subtree statistics for multiple trees
### Aliases: plotSubtrees

### ** Examples

# Define example tree set
graphs <- ExampleTrees[1-10]

# Violin plots of node outdegree by sample
plotSubtrees(graphs, "SAMPLE", "out", style="v")

# Violin plots of subtree size by sample
plotSubtrees(graphs, "SAMPLE", "size", style="v")

# Boxplot of node depth by isotype
plotSubtrees(graphs,  "ISOTYPE", "depth", style="b")




