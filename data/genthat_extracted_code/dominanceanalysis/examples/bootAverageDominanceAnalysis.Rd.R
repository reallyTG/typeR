library(dominanceanalysis)


### Name: bootAverageDominanceAnalysis
### Title: Bootstrap average values for Dominance Analysis
### Aliases: bootAverageDominanceAnalysis

### ** Examples

## No test: 
lm.1<-lm(Employed~.,longley)
da.ave.boot<-bootAverageDominanceAnalysis(lm.1,R=1000)
summary(da.ave.boot)
## End(No test)



