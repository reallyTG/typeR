library(discSurv)


### Name: intPredErrDisc
### Title: Integrated Prediction Error Curve
### Aliases: intPredErrDisc
### Keywords: survival

### ** Examples

#####################################################
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

# Estimate, for example, a generalized, additive model in discrete survival analysis
gamFit <- gam (formula=y ~ s(timeInt) + age + logwage, data=LongTrain, family=binomial())

# Estimate survival function of each person in the test data
oneMinusPredHaz <- 1 - predict(gamFit, newdata=LongTest, type="response")
predSurv <- aggregate(formula=oneMinusPredHaz ~ obj, data=LongTest, FUN=cumprod)

# Prediction error in first and second interval
tryPredErrDisc1 <- predErrDiscShort (timepoints=1, 
estSurvList=predSurv [[2]], newTime=TestUnempDur$spell,
 newEvent=TestUnempDur$censor1, trainTime=TrainUnempDur$spell,
 trainEvent=TrainUnempDur$censor1)

# Estimate integrated prediction error
tryIntPredErrDisc <- intPredErrDisc (tryPredErrDisc1)
tryIntPredErrDisc

# Example up to interval 3 (higher intervals are truncated)
tryIntPredErrDisc2 <- intPredErrDisc (tryPredErrDisc1, tmax=3)
tryIntPredErrDisc2

##########################
# Example with cancer data

library(survival)
head(cancer)

# Data preparation and convertion to 30 intervals
cancerPrep <- cancer
cancerPrep$status <- cancerPrep$status-1
intLim <- quantile(cancerPrep$time, prob=seq(0, 1, length.out=30))
intLim [length(intLim)] <- intLim [length(intLim)] + 1

# Cut discrete time in smaller number of intervals
cancerPrep <- contToDisc(dataSet=cancerPrep, timeColumn="time", intervalLimits=intLim)

# Generate training and test data
set.seed(753)
TrainIndices <- sample (x=1:dim(cancerPrep) [1], size=dim(cancerPrep) [1]*0.75)
TrainCancer <- cancerPrep [TrainIndices, ]
TestCancer <- cancerPrep [-TrainIndices, ]
TrainCancer$timeDisc <- as.numeric(as.character(TrainCancer$timeDisc))
TestCancer$timeDisc <- as.numeric(as.character(TestCancer$timeDisc))

# Convert to long format
LongTrain <- dataLong(dataSet=TrainCancer, timeColumn="timeDisc", censColumn="status")
LongTest <- dataLong(dataSet=TestCancer, timeColumn="timeDisc", censColumn="status")
# Convert factors
LongTrain$timeInt <- as.numeric(as.character(LongTrain$timeInt))
LongTest$timeInt <- as.numeric(as.character(LongTest$timeInt))
LongTrain$sex <- factor(LongTrain$sex)
LongTest$sex <- factor(LongTest$sex)

# Estimate, for example, a generalized, additive model in discrete survival analysis
gamFit <- gam (formula=y ~ s(timeInt) + s(age) + sex + ph.ecog, data=LongTrain, family=binomial())
summary(gamFit)

# Estimate survival function of each person in the test data
oneMinusPredHaz <- 1 - predict(gamFit, newdata=LongTest, type="response")
predSurv <- aggregate(formula=oneMinusPredHaz ~ obj, data=LongTest, FUN=cumprod)

# One survival curve is missing: Replace the missing values,
# with average value of other survival curves
predSurvTemp <- predSurv [[2]]
for(i in 1:length(predSurv [[2]])) {
  lenTemp <- length(predSurv [[2]] [[i]])
  if(lenTemp < 32) {
    predSurvTemp [[i]] <- c(predSurv [[2]] [[i]], rep(NA, 30-lenTemp))
  }
}
# Calculate average survival curve
avgSurv <- rowMeans(do.call(cbind, predSurvTemp), na.rm=TRUE) [1:4]
# Insert into predicted survival curves
predSurvTemp <- predSurv [[2]]
for(i in 3:(length(predSurvTemp)+1)) {
  if(i==3) {
    predSurvTemp [[i]] <- avgSurv
  }
  else {
    predSurvTemp [[i]] <- predSurv [[2]] [[i-1]]
  }
}
# Check if the length of all survival curves is equal to the observed
# time intervals in test data
all(sapply(1:length(predSurvTemp), function (x) length(predSurvTemp [[x]]))==
as.numeric(as.character(TestCancer$timeDisc))) # TRUE

# Prediction error second interval
tryPredErrDisc1 <- predErrDiscShort (timepoints=2, 
estSurvList=predSurvTemp, newTime=TestCancer$timeDisc,
 newEvent=TestCancer$status, trainTime=TrainCancer$timeDisc,
 trainEvent=TrainCancer$status)

# Calculate integrated prediction error
tryIntPredErrDisc <- intPredErrDisc (tryPredErrDisc1)
tryIntPredErrDisc



