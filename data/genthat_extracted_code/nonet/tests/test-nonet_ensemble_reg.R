context("Checking nonet_ensemble Regression")


# Setup
dataframe <- data.frame(banknote_authentication[500:800, ])

#First Linear Regression Model
index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

#Feature selection using rfe in caret
control <- rfeControl(functions = rfFuncs,
  method = "repeatedcv",
  repeats = 2,
  verbose = FALSE)

outcomeName <- 'entropy'
predictors <- c("variance", "skewness", "class")

banknote_lm_first <- train(trainSet[,predictors],trainSet[,outcomeName],method='lm')

predictions_lm_first <- predict.train(object=banknote_lm_first, testSet[,predictors])

# Second Linear Regression Model
index <- createDataPartition(dataframe$class, p=0.75, list=FALSE)
trainSet <- dataframe[ index,]
testSet <- dataframe[-index,]

#Feature selection using rfe in caret
control <- rfeControl(functions = rfFuncs,
  method = "repeatedcv",
  repeats = 2,
  verbose = FALSE)

outcomeName <- 'entropy'
predictors <- c("curtosis", "skewness", "class")

banknote_lm_second <- train(trainSet[,predictors],trainSet[,outcomeName],method='lm')

predictions_lm_second <- predict.train(object=banknote_lm_second, testSet[,predictors])


Stack_object <- list(predictions_lm_first, predictions_lm_second)

names(Stack_object) <- c("lm_first", "lm_second")

prediction_nonet <- nonet_ensemble(Stack_object, "lm_first")

# Test

test_that("predictions_lm_first return numeric vector", {
  expect_is(predictions_lm_first, "numeric")
})

test_that("predictions_lm_second return numeric vector", {
  expect_is(predictions_lm_second, "numeric")
})

test_that("prediction_nonet return numeric vector", {
  expect_is(prediction_nonet, "numeric")
})

