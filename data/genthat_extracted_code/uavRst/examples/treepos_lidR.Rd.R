library(uavRst)


### Name: treepos_lidR
### Title: tree top detection based on local maxima filters as provided by
###   'lidR'
### Aliases: treepos_lidR

### ** Examples

## Not run: 
##D require(uavRst)
##D ## required packages
##D require(uavRst)
##D 
##D  data(chm_seg)
##D 
##D ## find trees
##D tPoslidR <- treepos_lidR(chm = chm_seg[[1]],
##D                     movingWin = 3,
##D                     minTreeAlt = 15)
##D ## visualisation
##D # mapview::mapview(tPoslidR)
##D raster::plot(tPoslidR)
## End(Not run)



