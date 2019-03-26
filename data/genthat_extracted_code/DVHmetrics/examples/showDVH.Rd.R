library(DVHmetrics)


### Name: showDVH
### Title: Display dose volume histograms
### Aliases: showDVH showDVH.DVHs showDVH.DVHLst showDVH.DVHLstLst

### ** Examples

showDVH(dataMZ, byPat=TRUE, structure=c("HEART", "AMYOCL"))

# matches patients P123 and P234
showDVH(dataMZ, byPat=FALSE, patID="23", fixed=FALSE)



