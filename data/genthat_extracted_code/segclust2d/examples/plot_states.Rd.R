library(segclust2d)


### Name: plot_states
### Title: Plot states statistics
### Aliases: plot_states

### ** Examples

## Not run: 
##D  
##D #res.segclust is the results of the segmentation-clustering algorithm 
##D ncluster = 3 
##D nseg = 10 
##D g <- plot_states(output = res.segclust$outputs[[paste(ncluster,"class -",nseg, "segments")]],
##D diag.var = c("dist","angle2")
##D #res.seg is the results of the segmentation-only algorithm 
##D nseg = 10 
##D g <- plot_states(output = res.segclust$outputs[[paste(nseg, "segments")]],
##D diag.var = c("dist","angle2")) 
## End(Not run)



