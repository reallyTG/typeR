## ------------------------------------------------------------------------
library(caret)
library(ggplot2)
library(nonet)

## ------------------------------------------------------------------------
dataframe <- data.frame(banknote_authentication)
head(dataframe)

## ------------------------------------------------------------------------
index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

## ------------------------------------------------------------------------
control <- rfeControl(functions = rfFuncs,
  method = "repeatedcv",
  repeats = 3,
  verbose = FALSE)

## ------------------------------------------------------------------------
outcomeName <- 'entropy'
predictors <- c("variance", "skewness", "class")

## ------------------------------------------------------------------------
banknote_lm_first <- train(trainSet[,predictors],trainSet[,outcomeName],method='lm')

## ------------------------------------------------------------------------
predictions_lm_first <- predict.train(object=banknote_lm_first, testSet[,predictors])

## ------------------------------------------------------------------------
index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

## ------------------------------------------------------------------------
control <- rfeControl(functions = rfFuncs,
  method = "repeatedcv",
  repeats = 3,
  verbose = FALSE)

## ------------------------------------------------------------------------
outcomeName <- 'entropy'
predictors <- c("curtosis", "skewness", "class")

## ------------------------------------------------------------------------
banknote_lm_second <- train(trainSet[,predictors],trainSet[,outcomeName],method='lm')

## ------------------------------------------------------------------------
predictions_lm_second <- predict.train(object=banknote_lm_second, testSet[,predictors])

## ------------------------------------------------------------------------
Stack_object <- list(predictions_lm_first, predictions_lm_second)

## ------------------------------------------------------------------------
names(Stack_object) <- c("lm_first", "lm_second")

## ------------------------------------------------------------------------
prediction_nonet <- nonet_ensemble(Stack_object, "lm_first")

## ------------------------------------------------------------------------
Actual_Pred <- data.frame(cbind(actuals = testSet[,outcomeName], predictions = prediction_nonet))  
head(Actual_Pred)

## ------------------------------------------------------------------------
accuracy <- cor(Actual_Pred)
accuracy

## ---- warning = FALSE----------------------------------------------------
plot_first <- nonet_plot(Actual_Pred$actuals, Actual_Pred$predictions, Actual_Pred, plot_type = "hist")
plot_first

## ---- warning = FALSE----------------------------------------------------
plot_second <- nonet_plot(Actual_Pred$predictions, Actual_Pred$actuals, Actual_Pred, plot_type = "hist")
plot_second

