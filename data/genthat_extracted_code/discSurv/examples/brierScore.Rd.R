library(discSurv)


### Name: brierScore
### Title: Brier Score Calculation
### Aliases: brierScore
### Keywords: survival

### ** Examples

# Example with cross validation and unemployment data 
library(Ecdat)
library(caret)
data(UnempDur)
summary(UnempDur$spell)

# Extract subset of data
set.seed(635)
IDsample <- sample(1:dim(UnempDur)[1], 100)
UnempDurSubset <- UnempDur [IDsample, ]
head(UnempDurSubset)
range(UnempDurSubset$spell)
set.seed(7550)
CVfolds <- createFolds (y=UnempDurSubset$spell, returnTrain=TRUE, k=2)

# Calculate brier score
tryBrierScore <- brierScore (dataSet=UnempDurSubset, trainIndices=CVfolds, 
survModelFormula=spell ~ age + logwage, linkFunc="logit", 
censColumn="censor1", idColumn=NULL)
tryBrierScore



