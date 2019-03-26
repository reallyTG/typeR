## ------------------------------------------------------------------------
library(caret)
library(ggplot2)
library(nonet)

## ------------------------------------------------------------------------
dataframe <- data.frame(banknote_authentication)
head(dataframe)

## ------------------------------------------------------------------------
dataframe$class <- as.factor(ifelse(dataframe$class >= 1, 'Yes', 'No'))
dataframe <- data.frame(dataframe)
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
outcomeName <- 'class'
predictors <- c("variance", "skewness", "curtosis", "entropy")

## ---- message = FALSE, results = "hide"----------------------------------
banknote_rf <- train(trainSet[,predictors],trainSet[,outcomeName],method='rf')

## ---- message = FALSE, results = "hide"----------------------------------
banknote_nnet <- train(trainSet[,predictors],trainSet[,outcomeName],method='nnet')

## ------------------------------------------------------------------------
predictions_rf <- predict.train(object=banknote_rf,testSet[,predictors],type="prob")
predictions_nnet <- predict.train(object=banknote_nnet,testSet[,predictors],type="prob")

## ------------------------------------------------------------------------
predictions_rf_raw <- predict.train(object=banknote_rf,testSet[,predictors],type="raw")
predictions_nnet_raw <- predict.train(object=banknote_nnet,testSet[,predictors],type="raw")

## ------------------------------------------------------------------------
Stack_object <- list(predictions_rf$Yes, predictions_nnet$Yes)

## ------------------------------------------------------------------------
names(Stack_object) <- c("model_rf", "model_nnet")

## ------------------------------------------------------------------------
Stack_object_df <- data.frame(Stack_object)

## ------------------------------------------------------------------------
prediction_nonet_raw <- nonet_ensemble(Stack_object, "model_nnet")

## ------------------------------------------------------------------------
prediction_nonet <- as.factor(ifelse(prediction_nonet_raw >= "0.5", "Yes", "No"))

## ------------------------------------------------------------------------
nonet_eval <- confusionMatrix(prediction_nonet, testSet[,outcomeName])
nonet_eval_rf <- confusionMatrix(predictions_rf_raw,testSet[,outcomeName])
nonet_eval_nnet <- confusionMatrix(predictions_nnet_raw,testSet[,outcomeName])
nonet_eval_df <- data.frame(nonet_eval$table)
nonet_eval_rf_df <- data.frame(nonet_eval_rf$table)
nonet_eval_nnet_df <- data.frame(nonet_eval_nnet$table)

## ---- warning = FALSE----------------------------------------------------
plot_first <- nonet_plot(nonet_eval_df$Prediction, nonet_eval_df$Reference, nonet_eval_df, plot_type = "point")
plot_first

## ---- warning = FALSE----------------------------------------------------
plot_second <- nonet_plot(nonet_eval_rf_df$Prediction, nonet_eval_rf_df$Reference, nonet_eval_rf_df, plot_type = "boxplot")
plot_second

## ---- warning = FALSE----------------------------------------------------
plot_third <- nonet_plot(nonet_eval_nnet_df$Prediction, nonet_eval_nnet_df$Reference, nonet_eval_nnet_df, plot_type = "density")
plot_third

