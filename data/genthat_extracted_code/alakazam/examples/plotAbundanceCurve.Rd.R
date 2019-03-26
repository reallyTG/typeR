library(alakazam)


### Name: plotAbundanceCurve
### Title: Plots a clonal abundance distribution
### Aliases: plotAbundanceCurve

### ** Examples

# Estimate abundance by sample and plot
abund <- estimateAbundance(ExampleDb, "SAMPLE", nboot=100)
plotAbundanceCurve(abund, legend_title="Sample")




