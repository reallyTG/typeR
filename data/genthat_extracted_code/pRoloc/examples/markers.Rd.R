library(pRoloc)


### Name: mrkVecToMat
### Title: Create a marker vector or matrix.
### Aliases: mrkVecToMat markers mrkMatToVec mrkMatAndVec showMrkMat
###   isMrkMat isMrkVec mrkEncoding

### ** Examples

library("pRolocdata")
data(dunkley2006)
dunk <- mrkVecToMat(dunkley2006)
head(fData(dunk)$Markers)
fData(dunk)$markers <- NULL
dunk <- mrkMatToVec(dunk)
stopifnot(all.equal(fData(dunkley2006)$markers,
                    fData(dunk)$markers))



