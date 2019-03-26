## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library("breakDown")
library(kernlab)

wine_svm_model <- ksvm(quality~., data = wine)
wine_svm_model

# or with the e1071:::svm

library(e1071)
wine_svm_model <- svm(quality~., data = wine)
wine_svm_model


## ------------------------------------------------------------------------
library("breakDown")
nobs <- wine[5, , drop = FALSE]
base_prediction <- predict(wine_svm_model, nobs)
set.seed(1313)

explain_5_up <- broken(wine_svm_model, new_observation = nobs, 
                    data = wine, predict.function = predict,
                    baseline = "intercept", direction = "up")
explain_5_up

explain_5_down <- broken(wine_svm_model, new_observation = nobs, 
                    data = wine, predict.function = predict,
                    baseline = "intercept", direction = "down")
explain_5_down

## ---- fig.width=7--------------------------------------------------------
library(ggplot2)
plot(explain_5_up) + ggtitle(paste0("Prediction for SVM model ", round(base_prediction, 3)))
plot(explain_5_down) +  ggtitle(paste0("Prediction for SVM model ", round(base_prediction, 3)))

