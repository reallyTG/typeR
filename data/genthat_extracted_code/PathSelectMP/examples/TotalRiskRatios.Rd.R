library(PathSelectMP)


### Name: TotalRiskRatios
### Title: Calculate Risk Ratios for total effects
### Aliases: TotalRiskRatios
### Keywords: Risk Ratios Total Effects

### ** Examples

## Not run: 
##D 
##D InitD=Simulate(MissingYN=1)
##D xxx=Initialize(InitD,NumImpute=3,WhichCat=c(1,1,1,1,0))
##D ggg=AllBackwardSelect(xxx[[1]])
##D yyy=AllSummary2(xxx[[1]])
##D AllDat1=ConvertData2(xxx[[1]],xxx[[2]],yyy[[1]])
##D RRT1=lapply(AllDat1,TotalRiskRatios,InputDepVal=1)
## End(Not run)



