library(EGRETci)


### Name: ciBands
### Title: ciBands
### Aliases: ciBands

### ** Examples

library(EGRET)
eList <- Choptank_eList
nBoot <- 100
blockLength <- 200
## Not run: 
##D 
##D repAnnualResults <- vector(mode = "list", length = nBoot)
##D for(n in 1:nBoot){
##D    annualResults <- bootAnnual(eList, blockLength, startSeed = n) 
##D    repAnnualResults[[n]] <- annualResults
##D }
##D 
##D CIAnnualResults <- ciBands(eList, repAnnualResults)
##D 
## End(Not run)



