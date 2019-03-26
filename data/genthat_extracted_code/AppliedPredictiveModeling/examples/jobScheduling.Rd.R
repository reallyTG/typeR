library(AppliedPredictiveModeling)


### Name: schedulingData
### Title: HPC Job Scheduling Data
### Aliases: schedulingData
### Keywords: datasets

### ** Examples

data(schedulingData)

library(caret)

set.seed(1104)
inTrain <- createDataPartition(schedulingData$Class, p = .8, list = FALSE)

schedulingData$NumPending <- schedulingData$NumPending + 1

trainData <- schedulingData[ inTrain,]
testData  <- schedulingData[-inTrain,]

modForm <- as.formula(Class ~ Protocol + log10(Compounds) +
                      log10(InputFields)+ log10(Iterations) +
                      log10(NumPending) + Hour + Day)





