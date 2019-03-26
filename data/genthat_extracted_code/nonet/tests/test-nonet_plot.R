context("Checking nonet_plot functionality")

# Setup
Bank_Note <- data.frame(banknote_authentication[500:800, ])
dataframe <- Bank_Note
dataframe$class <- as.factor(ifelse(dataframe$class >= 1, 'Yes', 'No'))
dataframe <- data.frame(dataframe)

index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

#Feature selection using rfe in caret
control <- rfeControl(functions = rfFuncs,
  method = "repeatedcv",
  repeats = 2,
  verbose = FALSE)

outcomeName <- 'class'
predictors <- c("variance", "skewness", "curtosis", "entropy")

banknote_rf <- train(trainSet[,predictors],trainSet[,outcomeName],method='rf')

predictions_rf_raw <- predict.train(object=banknote_rf,testSet[,predictors],type="raw")

nonet_eval_rf <- confusionMatrix(predictions_rf_raw,testSet[,outcomeName])
nonet_eval_rf_df <- data.frame(nonet_eval_rf$table)

plot_first <- nonet_plot(nonet_eval_rf_df$Prediction, nonet_eval_rf_df$Reference, nonet_eval_rf_df, plot_type = "point")
plot_second <- nonet_plot(nonet_eval_rf_df$Prediction, nonet_eval_rf_df$Reference, nonet_eval_rf_df, plot_type = "boxplot")
plot_third <- nonet_plot(nonet_eval_rf_df$Prediction, nonet_eval_rf_df$Reference, nonet_eval_rf_df, plot_type = "density")

# Test
test_that("plot_first is a ggplot", {
  expect_is(plot_first,"ggplot")
})


test_that("plot_second is a ggplot", {
  expect_is(plot_second,"ggplot")
})


test_that("plot_third is a ggplot", {
  expect_is(plot_third,"ggplot")
})
