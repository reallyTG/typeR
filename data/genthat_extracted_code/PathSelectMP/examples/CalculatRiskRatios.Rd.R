library(PathSelectMP)


### Name: CalculatRiskRatios
### Title: Calculate Risk Ratios from Direct Effects
### Aliases: CalculatRiskRatios
### Keywords: Risk Ratios

### ** Examples

## Not run: 
##D 
##D InitD=Simulate(MissingYN=1)
##D xxx=Initialize(InitD,NumImpute=3,WhichCat=c(1,1,1,1,0))
##D ggg=AllBackwardSelect(xxx[[1]])
##D yyy=AllSummary2(xxx[[1]])
##D AllDat1=ConvertData2(xxx[[1]],xxx[[2]],yyy[[1]])
##D wwwA=lapply(AllDat1,CalculatRiskRatios,NADes=c(-99),WhichCat=c(1,1,1,1,0),WhichRiskCalc=c(0,
##D list(c(0,1,2)),list(c(0,1,2,4)),list(c(0,1,2)),0))
## End(Not run)



