library(segclust2d)


### Name: stat_segm
### Title: Calculate statistics on a given segmentation
### Aliases: stat_segm

### ** Examples

## Not run: 
##D #res.segclust is a result of a segmentation-clustering algorithm
##D param <- res.segclust$param[["3 class"]]
##D nseg = 10
##D out <- stat_segm(data, diag.var = c("dist","angle"),
##D  order.var = "dist", param = param, nseg=nseg, seg.type = "segclust")
##D 
## End(Not run)



