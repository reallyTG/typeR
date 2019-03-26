library(segclust2d)


### Name: plot_segm
### Title: Plot segmentation on time-serie
### Aliases: plot_segm

### ** Examples

## Not run: 
##D #res.segclust is the results of the segmentation-clustering algorithm
##D ncluster = 3
##D nseg = 10
##D  g <- plot_segm(data = res.segclust$data, output =
##D   res.segclust$outputs[[paste(ncluster,"class -",nseg, "segments")]], 
##D    diag.var = x$`Diagnostic variables`,x_col = 'dateTime)
##D #res.seg is the results of the segmentation-only algorithm
##D nseg = 10
##D  g <- plot_segm(data = res.segclust$data, 
##D  output = res.segclust$outputs[[paste(nseg, "segments")]], 
##D   diag.var = x$`Diagnostic variables`,x_col = 'dateTime)
##D  
## End(Not run)



