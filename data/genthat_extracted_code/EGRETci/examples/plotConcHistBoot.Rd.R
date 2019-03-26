library(EGRETci)


### Name: plotConcHistBoot
### Title: Graph of annual concentration, flow normalized concentration,
###   and confidence bands for flow normalized concentrations
### Aliases: plotConcHistBoot

### ** Examples

library(EGRET)
eList <- Choptank_eList
CIAnnualResults <- Choptank_CIAnnualResults
plotConcHistBoot(eList, CIAnnualResults)
plotConcHistBoot(eList, CIAnnualResults, yearStart=1990, yearEnd=2002)
## Not run: 
##D CIAnnualResults <- ciCalculations(eList, nBoot = 100, blockLength = 200)
##D plotConcHistBoot(eList, CIAnnualResults)
## End(Not run)



