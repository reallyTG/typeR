library(segclust2d)


### Name: map_segm
### Title: 'plot_segm' plot segmented traject on a map.
### Aliases: map_segm

### ** Examples

## Not run: 
##D #res.seg is a result of the segmentation-only algorithm : 
##D nseg = 10
##D outputs = res.seg$outputs[[paste(nseg, "segments")]]
##D map <- map_segm(data=res.seg$data,output=outputs)
##D #res.segclust is a result of the segmentation-clusturing algorithm : 
##D nseg = 10; ncluster = 3
##D outputs = res.segclust$outputs[[paste(ncluster,"class -",nseg, "segments")]]
##D map <- map_segm(data=res.seg$data,output=outputs)
## End(Not run)




