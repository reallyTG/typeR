library(ASMap)


### Name: subsetCross
### Title: Subset an R/qtl object
### Aliases: subsetCross
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

mapDH.s <- pullCross(mapDH, type = "seg.distortion")
mapDH.s <- subsetCross(mapDH.s, ind = 3:218)
dim(mapDH.s$seg.distortion$data)




