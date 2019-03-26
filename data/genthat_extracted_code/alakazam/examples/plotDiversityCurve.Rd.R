library(alakazam)


### Name: plotDiversityCurve
### Title: Plot the results of rarefyDiversity
### Aliases: plotDiversityCurve

### ** Examples

# Calculate diversity
div <- rarefyDiversity(ExampleDb, "SAMPLE", nboot=100)

# Plot diversity
plotDiversityCurve(div, legend_title="Sample")

#' # Plot diversity
plotDiversityCurve(div, legend_title="Sample", score="evenness")




