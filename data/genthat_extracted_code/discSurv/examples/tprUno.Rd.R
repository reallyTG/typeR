library(discSurv)


### Name: tprUno
### Title: True positive Rate Uno
### Aliases: tprUno
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

# Estimate true positive rate of time interval 7: 
# Correspondes to three and a half month duration (each interval is of length two weeks)
tryTPR <- tprUno (timepoint=7, dataSet=UnempDurSubset, 
trainIndices=CVfolds, survModelFormula=spell ~ age + logwage, 
censModelFormula=censor1 ~ 1, linkFunc="logit", idColumn=NULL)
tryTPR
plot(tryTPR)



