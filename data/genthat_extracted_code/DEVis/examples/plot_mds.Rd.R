library(DEVis)


### Name: plot_mds
### Title: Visualize multi-dimensional scaled data for all samples, with
###   group-wise metadata incorporated as colors and shapes.
### Aliases: plot_mds
### Keywords: distance mds visualization

### ** Examples

## Not run: 
##D 
##D #These examples assume "Time" and "Infection" columns exist in target metadata.
##D 
##D #Make a MDS plot showing all samples, colored based on time point.
##D plot_mds(filename="mds_plot.pdf", color_var="Time", shape_var="none",
##D           theme=1, returnData=FALSE)
##D 
##D #Make a MDS plot, colored based on time point with shapes based on infection.
##D plot_mds(filename="mds_plot.pdf", color_var="Time", shape_var="Infection",
##D           theme=2, returnData=FALSE)
##D 
## End(Not run)



