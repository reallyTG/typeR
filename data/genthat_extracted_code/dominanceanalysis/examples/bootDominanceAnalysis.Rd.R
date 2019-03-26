library(dominanceanalysis)


### Name: bootDominanceAnalysis
### Title: Bootstrap analysis for Dominance Analysis
### Aliases: bootDominanceAnalysis

### ** Examples

## No test: 
lm.1<-lm(Employed~.,longley)
da.boot<-bootDominanceAnalysis(lm.1,R=1000)
summary(da.boot)
## End(No test)



