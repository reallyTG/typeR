library(datarobot)


### Name: summary.dataRobotModel
### Title: DataRobot S3 object methods for R's generic summary function
### Aliases: summary.dataRobotModel summary.dataRobotProject
###   summary.listOfBlueprints summary.listOfFeaturelists
###   summary.listOfModels summary.projectSummaryList

### ** Examples

## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   modelId <- "5996f820af07fc605e81ead4"
##D   model <- GetModel(projectId, modelId)
##D   summary(model)
## End(Not run)
## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   project <- GetProject(projectId)
##D   summary(project)
## End(Not run)
## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   blueprints <- ListBlueprints(projectId)
##D   summary(blueprints)
## End(Not run)
## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   featureList <- CreateFeaturelist(projectId, "myFeaturelist", c("feature1", "feature2"))
##D   summary(featureList)
## End(Not run)
## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   models <- ListModels(projectId)
##D   summary(models)
## End(Not run)
## Not run: 
##D   projectSummary <- GetProjectList()
##D   summary(projectSummary)
## End(Not run)



