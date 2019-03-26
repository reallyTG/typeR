library(uavRst)


### Name: chmseg_RL
### Title: Watershed segmentation based on 'rLiDAR'
### Aliases: chmseg_RL

### ** Examples

## Not run: 
##D ## required packages
##D  require(uavRst)
##D ## read chm and tree position data
##D  data(chm_seg)
##D  data(trp_seg)
##D ## segmentation
##D  crownsRL <- chmseg_RL(chm= chm_seg[[1]],
##D                        treepos= trp_seg[[1]],
##D                        maxCrownArea = 150,
##D                        exclusion = 0.2)
##D ## visualisation
##D  raster::plot(crownsRL)
##D  
## End(Not run) 



