library(dominanceanalysis)


### Name: averageContribution
### Title: Retrieve average contribution of each predictor in a dominance
###   analysis.
### Aliases: averageContribution

### ** Examples

data(longley)
da.longley<-dominanceAnalysis(lm(Employed~.,longley))
averageContribution(da.longley)



