library(jointseg)


### Name: doCBS
### Title: Run CBS segmentation
### Aliases: doCBS

### ** Examples

## load known real copy number regions
affyDat <- acnr::loadCnRegionData(dataSet="GSE29172", tumorFraction=1)

## generate a synthetic CN profile
K <- 10
len <- 1e4
sim <- getCopyNumberDataByResampling(len, K, minLength=100, regData=affyDat)
datS <- sim$profile

## run CBS segmentation
res <- doCBS(datS[["c"]])
getTpFp(res$bkp, sim$bkp, tol=5, relax = -1)   ## true and false positives
plotSeg(datS, breakpoints=list(sim$bkp, res$bkp))



