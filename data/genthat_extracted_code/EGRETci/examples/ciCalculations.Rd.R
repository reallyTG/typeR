library(EGRETci)


### Name: ciCalculations
### Title: ciCalculations
### Aliases: ciCalculations

### ** Examples

library(EGRET)
eList <- Choptank_eList
## Not run: 
##D CIAnnualResults <- ciCalculations(eList)
##D 
##D seriesOut_2 <- runSeries(eList, windowSide = 7)
##D CIAnnualResults <- ciCalculations(seriesOut_2, 
##D                      nBoot = 10,
##D                      blockLength = 200,
##D                      widthCI = 90)
##D                      
##D  plotConcHistBoot(seriesOut_2, CIAnnualResults)
##D 
## End(Not run)



