library(uavRst)


### Name: treepos_RL
### Title: 'rLiDAR' based tree detection of a LiDAR-derived Canopy Height
###   Model (CHM)
### Aliases: treepos_RL

### ** Examples


## required packages
require(uavRst)

## load data
data(chm_seg)

## find trees
tPosRL <- treepos_RL(chm = chm_seg[[1]],
                    movingWin = 3,
                    minTreeAlt = 10)
## visualisation
raster::plot(tPosRL)



