library(uavRst)


### Name: chmseg_ITC
### Title: Decision tree segmentation method to grow individual tree crowns
###   based on 'itcSegment'
### Aliases: chmseg_ITC

### ** Examples

 require(uavRst)
 data(chm_seg)
##- segmentation
crownsITC<- chmseg_ITC(chm = chm_seg[[1]],
                       EPSG =3064,
                       movingWin = 7,
                       TRESHSeed = 0.45,
                       TRESHCrown = 0.55,
                       minTreeAlt = 5,
                       maxCrownArea = 50)

##- visualisation
raster::plot(crownsITC)



