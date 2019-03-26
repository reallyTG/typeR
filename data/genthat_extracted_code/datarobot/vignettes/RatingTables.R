## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  library(datarobot)
#  endpoint <- "https://<YOUR DATAROBOT URL GOES HERE>/api/v2"
#  apiToken <- "<YOUR API TOKEN GOES HERE>"
#  ConnectToDataRobot(endpoint = endpoint, token = apiToken)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  projectId <- "59dab74bbd2a54035786bfc0"
#  ratingTables <- ListRatingTables(projectId)
#  ratingTable <- ratingTables[[1]]
#  print(ratingTable)

## ----results = "asis", echo = FALSE--------------------------------------
ratingTable <- readRDS("ratingTable.rds")
print(ratingTable)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  projectId <- "59dab74bbd2a54035786bfc0"
#  ratingTableModels <- ListRatingTableModels(projectId)
#  ratingTableModel <- ratingTableModels[[1]]
#  ratingTableId <- ratingTableModel$ratingTableId
#  ratingTable <- GetRatingTable(projectId, ratingTableId)
#  print(ratingTable)

## ----results = "asis", echo = FALSE--------------------------------------
ratingTable <- readRDS("ratingTable.rds")
print(ratingTable)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  projectId <- "59dab74bbd2a54035786bfc0"
#  modelId <- "59dd0b01d9575702bec96e4"
#  ratingTableModel <- GetRatingTableModel(projectId, modelId)
#  ratingTableId <- ratingTableModel$ratingTableId
#  ratingTable <- GetRatingTable(projectId, ratingTableId)
#  print(ratingTable)

## ----results = "asis", echo = FALSE--------------------------------------
ratingTable <- readRDS("ratingTable.rds")
print(ratingTable)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  DownloadRatingTable(projectId, ratingTableId, "myRatingTable.csv")

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  DownloadRatingTable(projectId, ratingTableId, "myRatingTable.csv")
#  newRatingTableJobId <- CreateRatingTable(project,
#                                           modelId,
#                                           "myRatingTable.csv",
#                                           ratingTableName = "Modified File")
#  newRatingTable <- GetRatingTableFromJobId(project, newRatingTableJobId)
#  print(newRatingTable)

## ----results = "asis", echo = FALSE--------------------------------------
ratingTable <- readRDS("ratingTable.rds")
print(ratingTable)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  newModelJobId <- RequestNewRatingTableModel(project, newRatingTable)
#  newRatingTableModel <- GetRatingTableModelFromJobId(project, newModelJobId)
#  print(newRatingTableModel)

## ----results = "asis", echo = FALSE--------------------------------------
newRatingTableModel <- readRDS("ratingTableModel.RDS")
print(newRatingTableModel)

