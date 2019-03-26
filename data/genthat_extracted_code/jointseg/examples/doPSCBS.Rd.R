library(jointseg)


### Name: doPSCBS
### Title: Run Paired PSCBS segmentation
### Aliases: doPSCBS

### ** Examples

## Not run: 
##D     ## load known real copy number regions
##D     affyDat <- acnr::loadCnRegionData(dataSet="GSE29172", tumorFraction=1)
##D 
##D     ## generate a synthetic CN profile
##D     K <- 10
##D     len <- 1e4
##D     sim <- getCopyNumberDataByResampling(len, K, minLength=100, regData=affyDat)
##D     datS <- sim$profile
##D 
##D     ## run PSCBS segmentation
##D     Y <- as.matrix(subset(datS, select=c(c, b, genotype)))
##D     res <- doPSCBS(Y)
##D     getTpFp(res$bkp, sim$bkp, tol=5, relax = -1)   ## true and false positives
##D     plotSeg(datS, breakpoints=list(sim$bkp, res$bkp))
## End(Not run)



