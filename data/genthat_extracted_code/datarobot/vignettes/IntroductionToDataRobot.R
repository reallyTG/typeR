## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  library(datarobot)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  ConnectToDataRobot(endpoint = "YOUR-ENDPOINT-HERE", token = "YOUR-API_TOKEN-HERE")

## ---- echo = FALSE, message = FALSE--------------------------------------
library(MASS)
data(Boston)

## ---- echo = TRUE, message = FALSE---------------------------------------
str(Boston)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  projectObject <- SetupProject(dataSource = Boston, projectName = "BostonVignetteProject")

## ---- echo = FALSE-------------------------------------------------------
projectObject <- readRDS("projectObject.rds")
projectObject

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  SetTarget(project = projectObject, target = "medv")

## ---- echo = FALSE-------------------------------------------------------
library(datarobot)
listOfBostonModels <- readRDS("listOfBostonModels.rds")
fullFrame <- as.data.frame(listOfBostonModels, simple = FALSE)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  WaitForAutopilot(project = projectObject)
#  listOfBostonModels <- ListModels(projectObject)

## ---- echo = TRUE--------------------------------------------------------
summary(listOfBostonModels)

## ---- echo = TRUE, fig.width = 7, fig.height = 6, fig.cap = "Horizontal barplot of modelType and validation set RMSE values for all project models"----
plot(listOfBostonModels, orderDecreasing = TRUE)

## ---- echo = TRUE--------------------------------------------------------
modelFrame <- as.data.frame(listOfBostonModels)
modelType <- modelFrame$modelType
metric <- modelFrame$validationMetric
bestModelType <- modelType[which.min(metric)]
worstModelType <- modelType[which.max(metric)]

## ---- echo = FALSE-------------------------------------------------------
worstModelType

## ---- echo = FALSE-------------------------------------------------------
bestModelType

## ---- echo = TRUE--------------------------------------------------------
modelFrame$expandedModel

## ---- echo = TRUE--------------------------------------------------------
grep("Ridge", modelFrame$expandedModel)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  bestIndex <- which.min(metric)
#  bestModel <- listOfBostonModels[[bestIndex]]
#  dataset <- UploadPredictionDataset(projectObject, Boston)
#  bestPredictJobId <- RequestPredictionsForDataset(projectObject, bestModel$modelId, dataset$id)
#  bestPredictions <- GetPredictions(projectObject, bestPredictJobId)

## ---- echo = FALSE, fig.width = 7, fig.height = 6------------------------
medv <- Boston$medv
bestPredictions <- readRDS("bestPredictions.rds")
plot(medv, bestPredictions, xlab="Observed medv value", ylab="Predicted medv value",
     ylim = c(0, 50))
abline(a = 0, b = 1, lty = 2, lwd = 3, col = "red")
title("Best model")

