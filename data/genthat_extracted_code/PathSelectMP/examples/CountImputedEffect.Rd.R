library(PathSelectMP)


### Name: CountImputedEffect
### Title: Count and Average Effects for All Imputed Datasets
### Aliases: CountImputedEffect
### Keywords: Summary helper Direct Effects

### ** Examples

## Not run: 
##D 
##D InitD=Simulate()
##D xxx=Initialize(InitD)
##D ggg=AllBackwardSelect(xxx[[1]])
##D AllNames=xxx[[1]]
##D LL1=lapply(AllNames,CreateSummaryMats,OutputSE=FALSE,OutputPVal=FALSE,Directry=getwd())
##D LL1se=lapply(AllNames,CreateSummaryMats,OutputSE=TRUE,OutputPVal=FALSE,Directry=getwd())
##D LL1p=lapply(AllNames,CreateSummaryMats,OutputSE=FALSE,OutputPVal=TRUE,Directry=getwd())
##D LLL=CountImputedEffect(LL1,LL1se,LL1p,GreaterThanNum=0)
## End(Not run)



