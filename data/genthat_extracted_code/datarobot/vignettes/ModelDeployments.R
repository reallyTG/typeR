## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  projectId <- GetProjectList()$projectId[[1]]
#  model <- ListModels(projectId)[[1]]
#  RequestModelDeployment(projectId, model$modelId, label = "GBM Model for Loan Decisioning")

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  print(ListModelDeployments()[[1]])

## ----results = "asis", echo = FALSE--------------------------------------
modelDeployments <- readRDS("listModelDeployments.rds")
print(modelDeployments[[1]])

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  kable(head(summary(ListModelDeployments())))

## ----results = "asis", echo = FALSE--------------------------------------
library(knitr)
modelDeployments <- readRDS("listModelDeployments.rds")
kable(head(summary(modelDeployments)))

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  modelDeployments <- ListModelDeployments(limit = 2)
#  kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", echo = FALSE--------------------------------------
modelDeployments <- readRDS("listModelDeploymentsLimit2.rds")
kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  modelDeployments <- ListModelDeployments(limit = 2, orderBy = "-label")
#  kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", echo = FALSE--------------------------------------
modelDeployments <- readRDS("listModelDeploymentsLimit2OrderByLabel.rds")
kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  modelDeployments <- ListModelDeployments(offset = 2)
#  kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", echo = FALSE--------------------------------------
modelDeployments <- readRDS("listModelDeploymentsOffset2.rds")
kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  modelDeployments <- ListModelDeployments(query = "Decisioning")
#  kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", echo = FALSE--------------------------------------
modelDeployments <- readRDS("listModelDeploymentsQuery.rds")
kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  modelDeployments <- ListModelDeployments(status = "Active")
#  kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", echo = FALSE--------------------------------------
modelDeployments <- readRDS("listModelDeployments.rds")
kable(head(summary(modelDeployments)), longtable = TRUE, booktabs = TRUE, row.names = TRUE)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  modelDeployments <- ListModelDeployments()
#  modelDeployment <- GetModelDeployment(modelDeployments[[1]]$id)
#  print(modelDeployment)

## ----results = "asis", echo = FALSE--------------------------------------
modelDeployment <- readRDS("getModelDeployment.rds")
print(modelDeployment)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  modelDeployments <- ListModelDeployments()
#  UpdateModelDeployment(modelDeployments[[1]]$id, label = "Archived GBM", status = "archived")

## ----results = "asis", echo = FALSE--------------------------------------
modelDeployment <- readRDS("updatedModelDeployment.rds")
print(modelDeployment)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  modelDeployments <- ListModelDeployments()
#  serverHealth <- GetModelDeploymentServiceStatistics(modelDeployments[[1]]$id)
#  print(serverHealth)

## ----results = "asis", echo = FALSE--------------------------------------
serverHealth <- readRDS("serverHealth.rds")
print(serverHealth)

## ----results = "asis", message = FALSE, warning = FALSE, eval = FALSE----
#  modelDeployments <- ListModelDeployments()
#  actionLog <- GetModelDeploymentActionLog(modelDeployments[[1]]$id)
#  print(actionLog)

## ----results = "asis", echo = FALSE--------------------------------------
actionLog <- readRDS("actionLog.rds")
print(actionLog)

