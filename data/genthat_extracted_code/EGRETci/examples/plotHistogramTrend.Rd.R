library(EGRETci)


### Name: plotHistogramTrend
### Title: plotHistogramTrend
### Aliases: plotHistogramTrend

### ** Examples

library(EGRET)
eList <- Choptank_eList
eBoot <- Choptank_eBoot
caseSetUp <- Choptank_caseSetUp
plotHistogramTrend(eList, eBoot, caseSetUp, flux=FALSE)

## Not run: 
##D caseSetUp <- trendSetUp(eList)
##D eBoot <- wBT(eList,caseSetUp)
##D plotHistogramTrend(eList, eBoot, caseSetUp,  
##D                    flux=FALSE, xMin = -20, xMax = 60, xStep = 5)
##D plotHistogramTrend(eList, eBoot, caseSetUp, 
##D                    flux=TRUE, xMin = -20, xMax = 60, xStep = 5)
##D    
##D # Using runPairs:
##D year1 <- 1985
##D year2 <- 2009          
##D pairOut_2 <- runPairs(eList, year1, year2, windowSide = 7)
##D boot_pair_out <- runPairsBoot(eList, pairOut_2, nBoot = 10)
##D 
##D plotHistogramTrend(eList, boot_pair_out,caseSetUp=NA, 
##D                    flux=TRUE, xMin = -20, xMax = 60, xStep = 5)          
## End(Not run)



