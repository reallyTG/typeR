library(uavRst)


### Name: treepos_FT
### Title: 'ForestTools' tree top detection
### Aliases: treepos_FT

### ** Examples

##- required packages
 require(uavRst)

 data(chm_seg)
 
##- call ForestTools treepos function
 tposFT <- treepos_FT(chm = chm_seg[[1]],
            minTreeAlt = 10,
            maxCrownArea = 150)
            
##- visualize it
# mapview::mapview(tposFT)
raster::plot(tposFT)



