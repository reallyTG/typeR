library(alakazam)


### Name: plotEdgeTest
### Title: Plot the results of an edge permutation test
### Aliases: plotEdgeTest

### ** Examples

## No test: 
# Define example tree set
graphs <- ExampleTrees[1-10]

# Perform edge test on isotypes
x <- testEdges(graphs, "ISOTYPE", nperm=10)

# Plot
plotEdgeTest(x, color="steelblue", style="hist")
plotEdgeTest(x, style="cdf")
## End(No test)




