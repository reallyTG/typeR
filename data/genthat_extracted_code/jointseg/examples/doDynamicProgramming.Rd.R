library(jointseg)


### Name: doDynamicProgramming
### Title: Run segmentation by dynamic programming
### Aliases: doDynamicProgramming

### ** Examples


## load known real copy number regions
affyDat <- acnr::loadCnRegionData(dataSet="GSE29172", tumorFraction=1)

## generate a synthetic CN profile
K <- 10
len <- 1e4
sim <- getCopyNumberDataByResampling(len, K, minLength=100, regData=affyDat)
datS <- sim$profile

## run pruned DPA segmentation
resDP <- doDynamicProgramming(datS[["c"]], K=K)
getTpFp(resDP$bkp, sim$bkp, tol=5, relax = -1)   ## true and false positives
plotSeg(datS, breakpoints=list(sim$bkp, resDP$bkp))

## run 2d dynamic programming segmentation
K <- 2
len <- 1e3
sim <- getCopyNumberDataByResampling(len, K, minLength=100, regData=affyDat)
datS <- sim$profile
datS$d <- 2*abs(datS$b-1/2)
datS[which(datS$genotype!=0.5),"d"] <- NA
Y = cbind(datS$c,datS$d)
resDP2d <- doDynamicProgramming(Y, K = K)




