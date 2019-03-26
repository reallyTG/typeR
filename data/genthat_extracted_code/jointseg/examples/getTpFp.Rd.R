library(jointseg)


### Name: getTpFp
### Title: Calculate the number of true positives and false positives
### Aliases: getTpFp

### ** Examples


## load known real copy number regions
affyDat <- acnr::loadCnRegionData(dataSet="GSE29172", tumorFraction=0.7)

## generate a synthetic CN profile
K <- 10
len <- 2e4
sim <- getCopyNumberDataByResampling(len, K, minLength=100, regData=affyDat)
datS <- sim$profile

## (group-)fused Lasso segmentation
res <- PSSeg(data=datS, K=2*K, method="GFLars", stat="c", profile=TRUE)

## results of the initial (group-)fused lasso segmentation
getTpFp(res$initBkp, sim$bkp, tol=10, relax=-1)
getTpFp(res$initBkp, sim$bkp, tol=10, relax=0)
getTpFp(res$initBkp, sim$bkp, tol=10, relax=1)
plotSeg(datS, breakpoints=list(sim$bkp, res$initBkp))

## results after pruning (group-)fused Lasso candidates by dynamic programming)
getTpFp(res$bestBkp, sim$bkp, tol=10, relax=-1)
getTpFp(res$bestBkp, sim$bkp, tol=10, relax=0)
getTpFp(res$bestBkp, sim$bkp, tol=10, relax=1)
plotSeg(datS, breakpoints=list(sim$bkp, res$bestBkp))



