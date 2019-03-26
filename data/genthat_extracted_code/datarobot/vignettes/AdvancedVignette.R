## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  library(datarobot)
#  ConnectToDataRobot(endpoint = "http://<YOUR DR SERVER>/api/v2", token = "<YOUR API TOKEN>")

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  project <- SetupProject(dataSource = "path/to/lendingclub.csv",
#                          projectName = "AdvancedModelInsightsVignette")
#  SetTarget(project = project, target = "is_bad")
#  # increase the number of workers used by this project
#  UpdateProject(project = project$projectId, workerCount = 10)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  WaitForAutopilot(project = project)
#  results <- as.data.frame(ListModels(project))
#  saveRDS(results, "resultsModelInsights.rds")
#  library(knitr)
#  kable(head(results), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----echo = FALSE, results = "asis", message = FALSE, warning = FALSE----
results <- readRDS("resultsModelInsights.rds")
library(knitr)
kable(head(results), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  project <- GetProject("598b5182962d747b64e6c4f5")
#  allModels <- ListModels(project)
#  saveRDS(allModels, "modelsModelInsights.rds")
#  modelFrame <- as.data.frame(allModels)
#  metric <- modelFrame$validationMetric
#  if (project$metric %in% c('AUC', 'Gini Norm')) {
#    bestIndex <- which.max(metric)
#  } else {
#    bestIndex <- which.min(metric)
#  }
#  bestModel <- allModels[[bestIndex]]
#  bestModel$modelType

## ----echo = FALSE, results = "asis", message = FALSE, warning = FALSE----
allModels <- readRDS("modelsModelInsights.rds")
bestModel <- allModels[[1]]
bestModel$modelType

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  lc <- GetLiftChart(bestModel)
#  saveRDS(lc, "liftChartModelInsights.rds")
#  head(lc)

## ----echo = FALSE, results = "asis", message = FALSE, warning = FALSE----
lc <- readRDS("liftChartModelInsights.rds")
head(lc)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  ValidationLiftChart <- GetLiftChart(bestModel, source = "validation")
#  dr_dark_blue <- "#08233F"
#  dr_blue <- "#1F77B4"
#  dr_orange <- "#FF7F0E"
#  
#  # Function to plot lift chart
#  library(data.table)
#  LiftChartPlot <- function(ValidationLiftChart, bins = 10) {
#    if (60 %% bins == 0) {
#      ValidationLiftChart$bins <- rep(seq(bins), each = 60 / bins)
#      ValidationLiftChart <- data.table(ValidationLiftChart)
#      ValidationLiftChart[, actual := mean(actual), by = bins]
#      ValidationLiftChart[, predicted := mean(predicted), by = bins]
#      unique(ValidationLiftChart[, -"binWeight"])
#    } else {
#      "Please provide bins less than 60 and divisor of 60"
#    }
#  }
#  LiftChartData <- LiftChartPlot(ValidationLiftChart)
#  saveRDS(LiftChartData, "LiftChartDataVal.rds")
#  par(bg = dr_dark_blue)
#  plot(LiftChartData$Actual, col = dr_orange, pch = 20, type = "b",
#       main = "Lift Chart", xlab = "Bins", ylab = "Value")
#  lines(LiftChartData$Predicted, col = dr_blue, pch = 20, type = "b")

## ----echo = FALSE, results = "asis", message = FALSE, warning = FALSE----
dr_dark_blue <- "#08233F"
dr_blue <- "#1F77B4"
dr_orange <- "#FF7F0E"
LiftChartData <- readRDS("LiftChartDataVal.rds")
par(bg = dr_dark_blue)
plot(LiftChartData$Actual, col = dr_orange, pch = 20, type = "b",
     main = "Lift Chart", xlab = "Bins", ylab = "Value")
lines(LiftChartData$Predicted, col = dr_blue, pch = 20, type = "b")

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  AllLiftChart <- GetAllLiftCharts(bestModel)
#  LiftChartData <- LiftChartPlot(AllLiftChart[["crossValidation"]])
#  saveRDS(LiftChartData, "LiftChartDataCV.rds")
#  par(bg = dr_dark_blue)
#  plot(LiftChartData$Actual, col = dr_orange, pch = 20, type = "b",
#       main = "Lift Chart", xlab = "Bins", ylab = "Value")
#  lines(LiftChartData$Predicted, col = dr_blue, pch = 20, type = "b")

## ----echo = FALSE, results = "asis", message = FALSE, warning = FALSE----
LiftChartData <- readRDS("LiftChartDataCV.rds")
par(bg = dr_dark_blue)
plot(LiftChartData$Actual, col = dr_orange, pch = 20, type = "b",
     main = "Lift Chart", xlab = "Bins", ylab = "Value")
lines(LiftChartData$Predicted, col = dr_blue, pch = 20, type = "b")

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  roc <- GetRocCurve(bestModel)
#  saveRDS(roc, "ROCCurveModelInsights.rds")
#  head(roc)

## ----echo = FALSE, results = "asis", message = FALSE, warning = FALSE----
lc <- readRDS("ROCCurveModelInsights.rds")
head(lc)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  dr_roc_green <- "#03c75f"
#  ValidationRocCurve <- GetRocCurve(bestModel)
#  ValidationRocPoints <- ValidationRocCurve[["rocPoints"]]
#  saveRDS(ValidationRocPoints, "ValidationRocPoints.rds")
#  par(bg = dr_dark_blue, xaxs = "i", yaxs = "i")
#  plot(ValidationRocPoints$falsePositiveRate, ValidationRocPoints$truePositiveRate,
#       main = "ROC Curve",
#       xlab = "False Positive Rate (Fallout)", ylab = "True Positive Rate (Sensitivity)",
#       col = dr_roc_green,
#       ylim = c(0,1), xlim = c(0,1),
#       pch = 20, type = "b")

## ----echo = FALSE, results = "asis", message = FALSE, warning = FALSE----
dr_roc_green <- "#03c75f"
ValidationRocPoints <- readRDS("ValidationRocPoints.rds")
par(bg = dr_dark_blue, xaxs = "i", yaxs = "i")
plot(ValidationRocPoints$falsePositiveRate, ValidationRocPoints$truePositiveRate,
     main = "ROC Curve",
     xlab = "False Positive Rate (Fallout)", ylab = "True Positive Rate (Sensitivity)",
     col = dr_roc_green,
     ylim = c(0, 1), xlim = c(0, 1),
     pch = 20, type = "b")

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  AllRocCurve <- GetAllRocCurves(bestModel)
#  CrossValidationRocPoints <- AllRocCurve[['crossValidation']][['rocPoints']]
#  saveRDS(CrossValidationRocPoints, 'CrossValidationRocPoints.rds')
#  par(bg = dr_dark_blue, xaxs = "i", yaxs = "i")
#  plot(CrossValidationRocPoints$falsePositiveRate, CrossValidationRocPoints$truePositiveRate,
#       main = "ROC Curve",
#       xlab = "False Positive Rate (Fallout)", ylab = "True Positive Rate (Sensitivity)",
#       col = dr_roc_green,
#       ylim = c(0, 1), xlim = c(0, 1),
#       pch = 20, type = "b")

## ----echo = FALSE, results = "asis", message = FALSE, warning = FALSE----
CrossValidationRocPoints <- readRDS("CrossValidationRocPoints.rds")
par(bg = dr_dark_blue, xaxs = "i", yaxs = "i")
plot(CrossValidationRocPoints$falsePositiveRate, CrossValidationRocPoints$truePositiveRate,
     main = "ROC Curve",
     xlab = "False Positive Rate (Fallout)", ylab = "True Positive Rate (Sensitivity)",
     col = dr_roc_green,
     ylim = c(0, 1), xlim = c(0, 1),
     pch = 20, type = "b")

## ---- eval = TRUE--------------------------------------------------------
threshold <- ValidationRocPoints$threshold[which.max(ValidationRocPoints$f1Score)]

## ---- eval = TRUE--------------------------------------------------------
ValidationRocPoints[ValidationRocPoints$threshold == tail(Filter(function(x) x > threshold,
                                                                 ValidationRocPoints$threshold),
                                                          1), ]

## ---- warning = FALSE, eval = FALSE--------------------------------------
#  # Install libraries
#  install.packages(c("colormap", "devtools", "modelwordcloud"))
#  library(colormap)
#  library(modelwordcloud)

## ---- results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  # Find word-based models by looking for "word" processes
#  wordModels <- allModels[grep("Word", lapply(allModels, `[[`, "processes"))]
#  wordModel <- wordModels[[1]]
#  # Get word cloud
#  wordCloud <- GetWordCloud(project, wordModel$modelId)
#  saveRDS(wordCloud, "wordCloudModelInsights.rds")

## ---- echo = FALSE, results = "asis", message = FALSE, warning = FALSE----
library(colormap)
library(modelwordcloud)
wordCloud <- readRDS("wordCloudModelInsights.rds")

## ---- warning = FALSE, eval = TRUE---------------------------------------
# Remove stop words
wordCloud <- wordCloud[!wordCloud$isStopword, ]

# Make word cloud
colors <- c(colormap(c("#255FEC", "#2DBEF9")), colormap(c("#FFAC9D", "#D80909"), reverse = TRUE))
suppressWarnings(wordcloud(words = wordCloud$ngram,
                           freq = wordCloud$frequency,
                           coefficients = wordCloud$coefficient,
                           colors = colors,
                           scale = c(3, 0.3)))

