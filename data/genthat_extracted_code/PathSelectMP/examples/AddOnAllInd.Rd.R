library(PathSelectMP)


### Name: AddOnAllInd
### Title: Indirect Effect Writer
### Aliases: AddOnAllInd
### Keywords: Indirect Effects helper

### ** Examples

## Not run: 
##D 
##D InitD=Simulate(MissingYN=0,exampleNum=3)
##D xxx=Initialize(InitD,NumImpute=0,WhichCat=c(1,1,1,1,1,0,1,0),PasteIND=0)
##D ggg=AllBackwardSelect(xxx[[1]])
##D zzz=AllSummary(xxx[[1]])[[2]]
##D qqq=AddOnAllInd(xxx[[1]],zzz)
## End(Not run)



