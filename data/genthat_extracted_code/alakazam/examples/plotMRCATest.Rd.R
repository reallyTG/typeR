library(alakazam)


### Name: plotMRCATest
### Title: Plot the results of a founder permutation test
### Aliases: plotMRCATest

### ** Examples

## No test: 
# Define example tree set
graphs <- ExampleTrees[1-10]

# Perform MRCA test on isotypes
x <- testMRCA(graphs, "ISOTYPE", nperm=10)

# Plot
plotMRCATest(x, color="steelblue", style="hist")
plotMRCATest(x, style="cdf")
## End(No test)




