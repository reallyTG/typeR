library(r.jive)


### Name: showHeatmaps
### Title: Heatmaps for JIVE Decompositions
### Aliases: showHeatmaps

### ** Examples

##Load JIVE results (using default settings) for simulated data 
##as in Section 2.4 of Lock et al., 2013,
##with rank 1 joint structure, and rank 1 individual structure for each dataset
data(SimResults) 
# Display the heatmaps (may need to fiddle with plot window dimensions for this to appear well)
showHeatmaps(Results)
# Order by first data set individual structure
showHeatmaps(Results, order_by=1)
# Show only joint structure
showHeatmaps(Results, show_all=FALSE)



