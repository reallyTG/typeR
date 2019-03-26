library(nonet)


### Name: nonet_plot
### Title: Plot the predictions or results of nonet_ensemble
### Aliases: nonet_plot

### ** Examples

# nonet_plot functionality can be explained via below example
# Setup
library(caret)
library(nonet)
library(ggplot2)

# Load Data
dataframe <- data.frame(banknote_authentication[600:900, ])
dataframe$class <- as.factor(ifelse(dataframe$class >= 1, 'Yes', 'No'))

# Spliting into train and test
index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

# Feature selection 
 control <- rfeControl(functions = rfFuncs,
  method = "repeatedcv",
  repeats = 2,
  verbose = FALSE)

outcomeName <- 'class'
predictors <- c("curtosis", "entropy")

# Model Training & predictions
banknote_rf <- train(trainSet[,predictors],trainSet[,outcomeName],method='rf')
predictions_rf_raw <- predict.train(object=banknote_rf,testSet[,predictors],type="raw")

# Results
nonet_eval_rf <- confusionMatrix(predictions_rf_raw,testSet[,outcomeName])
eval_rf_df <- data.frame(nonet_eval_rf$table)
nonet_plot(eval_rf_df$Prediction, eval_rf_df$Reference, eval_rf_df, plot_type = "point")



