library(jointseg)


### Name: plotSeg
### Title: Plot signal and breakpoints with segment-level signal estimates
### Aliases: plotSeg

### ** Examples


affyDat <- acnr::loadCnRegionData(dataSet="GSE29172", tumorFraction=1)
sim <- getCopyNumberDataByResampling(1e4, 5, minLength=100, regData=affyDat)
dat <- sim$profile
res <- PSSeg(dat, method="RBS", stat=c("c", "d"), K=50)
bkpList <- list(true=sim$bkp, est=res$bestSeg)
plotSeg(dat, breakpoints=bkpList)



