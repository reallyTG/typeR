library(PathSelectMP)


### Name: CreateSummaryMats
### Title: Extract and Summarize Direct Effects
### Aliases: CreateSummaryMats
### Keywords: Summary helper Direct Effects

### ** Examples

## Not run: 
##D InitD=Simulate(MissingYN=1)
##D xxx=Initialize(InitD,NumImpute=3,WhichCat=c(1,1,1,1,0))
##D ggg=AllBackwardSelect(xxx[[1]])
##D LL1=lapply(xxx[[1]],CreateSummaryMats,OutputSE=FALSE,
##D OutputPVal=FALSE,Directry=getwd(),OutputFinalMat=1)
## End(Not run)



