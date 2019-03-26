## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- warning=FALSE, message=FALSE---------------------------------------
library(caret)

set.seed(2)
training <- twoClassSim(50, linearVars = 2)
trainX <- training[, -ncol(training)]
trainY <- training$Class

head(training)

## ------------------------------------------------------------------------
cctrl1 <- trainControl(method = "cv", number = 3, returnResamp = "all",
                       classProbs = TRUE, 
                       summaryFunction = twoClassSummary)

test_class_cv_model <- train(trainX, trainY, 
                             method = "glm", 
                             trControl = cctrl1,
                             metric = "ROC", 
                             preProc = c("center", "scale"))
test_class_cv_model

## ------------------------------------------------------------------------
predict.fun <- function(model, x) predict(model, x, type = "prob")[,1]
testing <- twoClassSim(10, linearVars = 2)
predict.fun(test_class_cv_model, testing[1,])

## ------------------------------------------------------------------------
library("breakDown")
explain_2 <- broken(test_class_cv_model, testing[1,], data = trainX, predict.function = predict.fun)
explain_2

## ---- fig.width=7--------------------------------------------------------
library(ggplot2)
plot(explain_2) + ggtitle("breakDown plot for caret/glm model")

