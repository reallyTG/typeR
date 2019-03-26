## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  library(datarobot)
#  endpoint <- "https://<YOUR DATAROBOT URL GOES HERE>/api/v2"
#  apiToken <- "<YOUR API TOKEN GOES HERE>"
#  ConnectToDataRobot(endpoint = endpoint, token = apiToken)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  project <- SetupProject(iris, projectName = "multiclassExample")
#  SetTarget(project,
#            "Species",
#            targetType = TargetType$Multiclass,
#            maxWait = 600)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  blueprint <- ListBlueprints(project)[[1]]
#  RequestNewModel(project, blueprint)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  model <- ListModels(project)[[1]]
#  dataset <- UploadPredictionDataset(project, iris)
#  predictJob <- RequestPredictionsForDataset(project, model$modelId, dataset$id)
#  predictions <- GetPredictions(project, predictJob)
#  print(table(predictions))

## ----results = "asis", echo = FALSE--------------------------------------
message("request issued, waiting for predictions")
message("Multiclass with labels setosa, versicolor, virginica")
print(table(readRDS("multiclassPredictions.rds")))

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  predictions <- GetPredictions(project, predictJob, type = "probability")
#  kable(head(predictions))

## ----results = "asis", echo = FALSE--------------------------------------
message("request issued, waiting for predictions")
message("Multiclass with labels setosa, versicolor, virginica")
library(knitr)
kable(head(readRDS("multiclassPredictionProbs.rds")))

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  confusionChart <- GetConfusionChart(model, source = DataPartition$VALIDATION)
#  kable(capture.output(confusionChart))

## ----results = "asis", echo = FALSE--------------------------------------
kable(capture.output(readRDS("confusionChart.rds")))

