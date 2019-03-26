library(nonet)


### Name: nonet_ensemble
### Title: Ensemble Prediction without using training labels
### Aliases: nonet_ensemble

### ** Examples

# nonet_ensemble functionality can be explained via below example
# Setup
library(caret)
library(nonet)
library(rlist)

# Load Data
dataframe <- data.frame(banknote_authentication[600:900, ])
dataframe$class <- as.factor(ifelse(dataframe$class >= 1, 'Yes', 'No'))

# First Model
# Spliting into train and test
index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

#Feature selection 
control <- rfeControl(functions = rfFuncs,
  method = "repeatedcv",
  repeats = 1,
  verbose = FALSE)

outcomeName <- 'class'
predictors <- c("variance", "skewness")

banknote_rf <- train(trainSet[,predictors],trainSet[,outcomeName],method='rf')
preds_rf_first <- predict.train(object=banknote_rf,testSet[,predictors],type="prob")
preds_rf_first_raw <- predict.train(object=banknote_rf,testSet[,predictors],type="raw")

# Second Model
# Spliting into train and test
index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

#Feature selection 
control <- rfeControl(functions = rfFuncs,
  method = "repeatedcv",
  repeats = 2,
  verbose = FALSE)

outcomeName <- 'class'
predictors <- c("curtosis", "entropy")

banknote_rf <- train(trainSet[,predictors],trainSet[,outcomeName],method='rf')
preds_rf_second <- predict.train(object=banknote_rf,testSet[,predictors],type="prob")
preds_rf_second_raw <- predict.train(object=banknote_rf,testSet[,predictors],type="raw")

Stack_object <- list(preds_rf_first$Yes, preds_rf_second$Yes)
names(Stack_object) <- c("model_rf_first", "model_rf_second")

# Prediction using nonet_ensemble function
prediction_nonet <- nonet_ensemble(Stack_object, "model_rf_second")




