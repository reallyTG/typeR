library(PathSelectMP)


### Name: NewNamesThresh
### Title: Threshold Names
### Aliases: NewNamesThresh
### Keywords: Threshold data

### ** Examples

## Not run: 
##D InitD=Simulate(MissingYN=1)
##D xxx=Initialize(InitD,NumImpute=3,WhichCat=c(1,1,1,1,0))
##D ggg=AllBackwardSelect(xxx[[1]])
##D yyy=AllSummary2(xxx[[1]])
##D zzz=AllSummary(xxx[[1]])[[2]]
##D qqq=AddOnAllInd(xxx[[1]],zzz)
##D NewNamesThresh("New_1000","NewData_1000","X$1",InitD)
## End(Not run)



