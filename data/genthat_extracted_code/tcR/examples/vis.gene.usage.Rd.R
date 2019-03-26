library(tcR)


### Name: vis.gene.usage
### Title: Histogram of segments usage.
### Aliases: vis.gene.usage vis.V.usage vis.J.usage

### ** Examples

## Not run: 
##D # Load your data.
##D load('immdata.rda')
##D # Compute V-usage statistics.
##D imm1.vs <- geneUsage(immdata[[1]], HUMAN_TRBV)
##D vis.V.usage(immdata, HUMAN_TRBV, .main = 'Immdata V-usage [1]', .dodge = T)
##D # Plot a histogram for one data frame using all gene segment data from V.gene column.
##D vis.V.usage(imm1.vs, NA, .main = 'Immdata V-usage [1]')
##D # Plot a grid of histograms - one histogram for V-usage for each data frame in .data.
##D vis.V.usage(immdata, HUMAN_TRBV, .main = 'Immdata V-usage', .dodge = F, .other = F)
## End(Not run)



