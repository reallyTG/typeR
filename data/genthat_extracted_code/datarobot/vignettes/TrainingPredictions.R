## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  models <- ListModels(projectId)
#  model <- models[[1]]
#  jobId <- RequestTrainingPredictions(model, dataSubset = DataSubset$All)
#  trainingPredictions <- GetTrainingPredictionsFromJobId(projectId, jobId)
#  kable(head(trainingPredictions), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", echo = FALSE--------------------------------------
library(knitr)
trainingPredictions <- readRDS("trainingPredictions.rds")
kable(head(trainingPredictions), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  trainingPredictions <- ListTrainingPredictions(projectId)
#  trainingPredictionId <- trainingPredictions[[1]]$id
#  trainingPrediction <- GetTrainingPredictions(projectId, trainingPredictionId)
#  kable(head(trainingPrediction), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", echo = FALSE--------------------------------------
trainingPrediction <- readRDS("trainingPrediction.rds")
kable(head(trainingPrediction), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  DownloadTrainingPredictions(projectId, trainingPredictionId, "trainingPredictions.csv")

