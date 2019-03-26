library(alakazam)


### Name: testEdges
### Title: Tests for parent-child annotation enchrichment in lineage trees
### Aliases: testEdges

### ** Examples

## No test: 
# Define example tree set
graphs <- ExampleTrees[1-10]

# Perform edge test on isotypes
x <- testEdges(graphs, "ISOTYPE", nperm=10)
print(x)
## End(No test)




