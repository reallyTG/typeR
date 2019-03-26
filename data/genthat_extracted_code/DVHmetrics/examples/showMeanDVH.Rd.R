library(DVHmetrics)


### Name: showMeanDVH
### Title: Show average dose volume histograms
### Aliases: showMeanDVH

### ** Examples

# mean DVH for HEART and AMYOCL averaged over patients
res <- getMeanDVH(dataMZ, byPat=FALSE, structure=c("HEART", "AMYOCL"))
showMeanDVH(res)



