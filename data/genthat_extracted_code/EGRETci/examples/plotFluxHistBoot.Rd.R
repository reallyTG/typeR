library(EGRETci)


### Name: plotFluxHistBoot
### Title: Graph of annual flux, flow normalized flux, and confidence bands
###   for flow normalized flux
### Aliases: plotFluxHistBoot

### ** Examples

library(EGRET)
eList <- Choptank_eList 
CIAnnualResults <- Choptank_CIAnnualResults
plotFluxHistBoot(eList, CIAnnualResults, fluxUnit=5)

## Not run: 
##D CIAnnualResults <- ciCalculations(eList, nBoot = 100, blockLength = 200)
##D plotFluxHistBoot(eList, CIAnnualResults, fluxUnit=5)
## End(Not run)



