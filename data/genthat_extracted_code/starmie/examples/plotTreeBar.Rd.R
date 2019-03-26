library(starmie)


### Name: plotTreeBar
### Title: Generate a barplot of a Structure or Admixture run.
### Aliases: plotTreeBar

### ** Examples

# Read file using K = 6 and plot results
k6_data <- exampleStructure("barplot")
# our facetted structure plot with tree
plotTreeBar(k6_data)
# standard 'structure' bar plot with tree
plotTreeBar(k6_data, facet = FALSE)
# Admix example
k3_data <- exampleAdmixture()[[3]]
plotTreeBar(k3_data)



