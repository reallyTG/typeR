library(starmie)


### Name: plotBar
### Title: Generate a barplot of a Structure or Admixture run.
### Aliases: plotBar

### ** Examples

# Read file using K = 6 and plot results
k6_data <- exampleStructure("barplot")
# Generate standard 'structure' barplot
plotBar(k6_data, facet = FALSE)
# adding group information
set.seed(212)
pops <- data.frame(id = k6_data$ancest_df[,1],
population = sample(letters[1:3], nrow(k6_data$ancest_df), replace = TRUE))
# our facetted structure plot
plotBar(k6_data, pops)
# standard 'structure' bar plot
plotBar(k6_data, pops, facet = FALSE)
#' admixture example
k3_data <- exampleAdmixture()[[3]]
plotBar(k3_data)



