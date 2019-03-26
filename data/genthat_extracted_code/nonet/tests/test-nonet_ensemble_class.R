context("Check nonet_ensemble Classification")

# Setup
dataframe <- data.frame(banknote_authentication[500:800, ])
dataframe$class <- as.factor(ifelse(dataframe$class >= 1, 'Yes', 'No'))
# First Model
index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

# Feature selection 
control <- rfeControl(functions = rfFuncs,
  method = "repeatedcv",
  repeats = 2,
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

# Feature selection 
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
prediction_nonet_raw <- nonet_ensemble(Stack_object, "model_rf_second")
# Converting probabilities into classes
prediction_nonet <- as.factor(ifelse(prediction_nonet_raw >= "0.5", "Yes", "No"))


# Test
test_that("preds_rf_first$Yes return numeric vector", {
  expect_is(preds_rf_first$Yes, "numeric")
})


test_that("preds_rf_second$Yes return numeric vector", {
  expect_is(preds_rf_second$Yes, "numeric")
})


test_that("prediction_nonet_raw return numeric vector", {
  expect_is(prediction_nonet_raw, "numeric")
})
