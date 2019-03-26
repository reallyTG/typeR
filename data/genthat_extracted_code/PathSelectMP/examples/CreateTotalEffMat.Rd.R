library(PathSelectMP)


### Name: CreateTotalEffMat
### Title: Summarizes Total Effects
### Aliases: CreateTotalEffMat
### Keywords: Summary Total Effects

### ** Examples

## Not run: 
##D 
##D InitD=Simulate(MissingYN=1)
##D xxx=Initialize(InitD,NumImpute=3,WhichCat=c(1,1,1,1,0))
##D ggg=AllBackwardSelect(xxx[[1]])
##D yyy=AllSummary2(xxx[[1]])
##D zzz=AllSummary(xxx[[1]])[[2]]
##D qqq=AddOnAllInd(xxx[[1]],zzz)
##D AllDat1=ConvertData2(xxx[[1]],xxx[[2]],yyy[[1]])
##D AllFileNames1=sapply(AllDat1,OnlyNumberElement,1)
##D Tots=CreateTotalEffMat(AllFileNames1[1],Directry=getwd())
## End(Not run)



