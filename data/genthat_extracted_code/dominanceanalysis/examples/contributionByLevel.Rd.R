library(dominanceanalysis)


### Name: contributionByLevel
### Title: Retrieve average contribution by level for each predictor
### Aliases: contributionByLevel

### ** Examples

data(longley)
da.longley<-dominanceAnalysis(lm(Employed~.,longley))
contributionByLevel(da.longley)



