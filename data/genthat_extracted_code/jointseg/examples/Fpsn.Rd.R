library(jointseg)


### Name: Fpsn
### Title: Pruned dynamic programming algorithm
### Aliases: Fpsn

### ** Examples


## load known real copy number regions
affyDat <- acnr::loadCnRegionData(dataSet="GSE29172", tumorFraction=1)

## generate a synthetic CN profile
K <- 10
len <- 1e4
sim <- getCopyNumberDataByResampling(len, K, minLength=100, regData=affyDat)
datS <- sim$profile

## run pruned DPA segmentation
res <- Fpsn(datS[["c"]], Kmax=2*K+1)

## plot segmentation results for the true number of breakpoints
bkp <- res$t.est[K+1, 1:K]
plotSeg(datS, breakpoints=bkp)



