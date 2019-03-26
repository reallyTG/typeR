library(DVHmetrics)


### Name: getMeanDVH
### Title: Point-wise mean DVH with point-wise SDs
### Aliases: getMeanDVH getMeanDVH.DVHs getMeanDVH.DVHLst
###   getMeanDVH.DVHLstLst

### ** Examples

res1 <- getMeanDVH(dataMZ, byPat=TRUE, structure=c("HEART", "AMYOCL"))
head(res1)

# average differential DVHs
# matches patients P123 and P234
res2 <- getMeanDVH(dataMZ, fun=list(min=min, max=max),
                   cumul=FALSE, byPat=FALSE,
                   patID="23", fixed=FALSE)
head(res2)



