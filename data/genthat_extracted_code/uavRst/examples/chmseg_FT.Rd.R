library(uavRst)


### Name: chmseg_FT
### Title: Watershed segmentation based on 'ForestTools'
### Aliases: chmseg_FT

### ** Examples

 require(uavRst)
## get the data
 data(chm_seg)
 data(trp_seg)
## you may create the Foresttools tree tops
## otherwise the raster is transformed to a SPDF according to the FT format   
#trp <- ForestTools::vwf(chm_seg[[1]], winFun = function(x){x * 0.06 + 0.5}, minHeight = 2)
## segmentation
crownsFT <- chmseg_FT(chm = chm_seg[[1]],
                       treepos = trp_seg[[1]],
                       format = "polygons",
                       minTreeAlt = 23,
                       winRadius = 1.5,
                       verbose = FALSE)

## Visualisation
raster::plot(crownsFT)




