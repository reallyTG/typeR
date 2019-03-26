library(discSurv)


### Name: devResid
### Title: Deviance Residuals
### Aliases: devResid
### Keywords: survival

### ** Examples

library(Ecdat)
# Example with cross validation and unemployment data 
data(UnempDur)
summary(UnempDur$spell)

# Extract subset of data
set.seed(635)
IDsample <- sample(1:dim(UnempDur)[1], 100)
UnempDurSubset <- UnempDur [IDsample, ]

# Calculate deviance residuals for the unemployment data subset
devianceResiduals <- devResid (dataSet=UnempDurSubset, survModelFormula=spell ~ age + logwage, 
censColumn="censor1", linkFunc="logit", idColumn=NULL)
devianceResiduals



