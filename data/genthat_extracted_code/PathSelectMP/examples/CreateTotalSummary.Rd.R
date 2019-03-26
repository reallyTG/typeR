library(PathSelectMP)


### Name: CreateTotalSummary
### Title: Summarizes and Averages Total Effects
### Aliases: CreateTotalSummary
### Keywords: Summary

### ** Examples

## Not run: 
##D 
##D 
##D InitD=Simulate(MissingYN=1)
##D xxx=Initialize(InitD,NumImpute=3,WhichCat=c(1,1,1,1,0))
##D ggg=AllBackwardSelect(xxx[[1]])
##D yyy=AllSummary2(xxx[[1]])
##D zzz=AllSummary(xxx[[1]])[[2]]
##D qqq=AddOnAllInd(xxx[[1]],zzz)
##D AllDat1=ConvertData2(xxx[[1]],xxx[[2]],yyy[[1]])
##D AllFileNames1=sapply(AllDat1,OnlyNumberElement,1)
##D Tots1=lapply(AllFileNames1,CreateTotalEffMat,Directry=getwd())	
##D AllTotEffOutput1=CreateTotalSummary(Tots1,GreaterThanNum=0)
## End(Not run)



