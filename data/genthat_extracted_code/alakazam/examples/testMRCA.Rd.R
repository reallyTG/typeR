library(alakazam)


### Name: testMRCA
### Title: Tests for MRCA annotation enrichment in lineage trees
### Aliases: testMRCA

### ** Examples

## No test: 
# Define example tree set
graphs <- ExampleTrees[1-10]

# Perform MRCA test on isotypes
x <- testMRCA(graphs, "ISOTYPE", nperm=10)
print(x)
## End(No test)




