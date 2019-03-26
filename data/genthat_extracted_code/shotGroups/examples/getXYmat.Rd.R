library(shotGroups)


### Name: getXYmat
### Title: Extract (x,y)-coordinates (relative to point of aim) from a data
###   frame
### Aliases: getXYmat

### ** Examples

data(DFcm)

# select data from only first series
DFsub <- subset(DFcm, series == 1)
getXYmat(DFsub, xyTopLeft=TRUE, relPOA=TRUE)



