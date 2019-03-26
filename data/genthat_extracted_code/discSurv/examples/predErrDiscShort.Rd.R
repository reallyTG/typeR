library(discSurv)


### Name: predErrDiscShort
### Title: Prediction Error Curves for arbitrary prediction models
### Aliases: predErrDiscShort
### Keywords: survival

### ** Examples

# Example with cross validation and unemployment data 
library(Ecdat)
library(mgcv)
data(UnempDur)
summary(UnempDur$spell)

# Extract subset of data
set.seed(635)
IDsample <- sample(1:dim(UnempDur)[1], 100)
UnempDurSubset <- UnempDur [IDsample, ]
head(UnempDurSubset)
range(UnempDurSubset$spell)

# Generate training and test data
set.seed(7550)
TrainIndices <- sample (x=1:dim(UnempDurSubset) [1], size=75)
TrainUnempDur <- UnempDurSubset [TrainIndices, ]
TestUnempDur <- UnempDurSubset [-TrainIndices, ]

# Convert to long format
LongTrain <- dataLong(dataSet=TrainUnempDur, timeColumn="spell", censColumn="censor1")
LongTest <- dataLong(dataSet=TestUnempDur, timeColumn="spell", censColumn="censor1")
# Convert factor to numeric for smoothing
LongTrain$timeInt <- as.numeric(as.character(LongTrain$timeInt))
LongTest$timeInt <- as.numeric(as.character(LongTest$timeInt))

######################################################################
# Estimate a generalized, additive model in discrete survival analysis

gamFit <- gam (formula=y ~ s(timeInt) + age + logwage, data=LongTrain, family=binomial())

# Estimate survival function of each person in the test data
oneMinusPredHaz <- 1 - predict(gamFit, newdata=LongTest, type="response")
predSurv <- aggregate(formula=oneMinusPredHaz ~ obj, data=LongTest, FUN=cumprod)

# Prediction error in first interval
tryPredErrDisc1 <- predErrDiscShort (timepoints=1, 
estSurvList=predSurv [[2]], newTime=TestUnempDur$spell,
newEvent=TestUnempDur$censor1, trainTime=TrainUnempDur$spell,
 trainEvent=TrainUnempDur$censor1)
tryPredErrDisc1
summary(tryPredErrDisc1)

# Prediction error of the 2. to 10. interval
tryPredErrDisc2 <- predErrDiscShort (timepoints=2:10,
estSurvList=predSurv [[2]], newTime=TestUnempDur$spell,
newEvent=TestUnempDur$censor1, trainTime=TrainUnempDur$spell,
trainEvent=TrainUnempDur$censor1)
tryPredErrDisc2
summary(tryPredErrDisc2)

########################################
# Fit a random discrete survival forest

library(randomForest)
LongTrainRF <- LongTrain
LongTrainRF$y <- factor(LongTrainRF$y)
rfFit <- randomForest (formula=y ~ timeInt + age + logwage, data=LongTrainRF)

# Estimate survival function of each person in the test data
oneMinusPredHaz <- 1 - predict(rfFit, newdata=LongTest, type="prob") [, 2]
predSurv <- aggregate(formula=oneMinusPredHaz ~ obj, data=LongTest, FUN=cumprod)

# Prediction error in first interval
tryPredErrDisc1 <- predErrDiscShort (timepoints=1, 
estSurvList=predSurv [[2]], newTime=TestUnempDur$spell,
newEvent=TestUnempDur$censor1, trainTime=TrainUnempDur$spell,
 trainEvent=TrainUnempDur$censor1)
tryPredErrDisc1
summary(tryPredErrDisc1)

# Prediction error of the 2. to 10. interval
tryPredErrDisc2 <- predErrDiscShort (timepoints=2:10,
estSurvList=predSurv [[2]], newTime=TestUnempDur$spell,
newEvent=TestUnempDur$censor1, trainTime=TrainUnempDur$spell,
trainEvent=TrainUnempDur$censor1)
tryPredErrDisc2
summary(tryPredErrDisc2)



