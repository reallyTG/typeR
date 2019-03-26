library(jointseg)


### Name: getCopyNumberDataByResampling
### Title: Generate a copy number profile by resampling
### Aliases: getCopyNumberDataByResampling

### ** Examples


affyDat <- acnr::loadCnRegionData(dataSet="GSE29172", tumorFraction=1)
sim <- getCopyNumberDataByResampling(len=1e4, nBkp=5, minLength=100, regData=affyDat)
plotSeg(sim$profile, sim$bkp)

## another run with identical parameters
bkp <- sim$bkp
regions <- sim$regions
sim2 <- getCopyNumberDataByResampling(len=1e4, bkp=bkp, regData=affyDat, regions=regions)
plotSeg(sim2$profile, bkp)

## change tumor fraction but keep same "truth"
affyDatC <- acnr::loadCnRegionData(dataSet="GSE29172", tumorFraction=0.5)
simC <- getCopyNumberDataByResampling(len=1e4, bkp=bkp, regData=affyDatC, regions=regions)
plotSeg(simC$profile, bkp)

## restrict to only normal, single copy gain, and copy-neutral LOH
## with the same bkp
affyDatR <- subset(affyDat, region %in% c("(1,1)", "(0,2)", "(1,2)"))
simR <- getCopyNumberDataByResampling(len=1e4, bkp=bkp, regData=affyDatR)
plotSeg(simR$profile, bkp)

## Same 'truth', on another dataSet
regions <- simR$regions
illuDat <- acnr::loadCnRegionData(dataSet="GSE11976", tumorFraction=1)
sim <- getCopyNumberDataByResampling(len=1e4, bkp=bkp, regData=illuDat, regions=regions)
plotSeg(sim$profile, sim$bkp)




