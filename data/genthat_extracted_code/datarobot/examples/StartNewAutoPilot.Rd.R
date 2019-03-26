library(datarobot)


### Name: StartNewAutoPilot
### Title: Starts autopilot on provided featurelist. Only one autopilot can
###   be running at the time. That's why any ongoing autopilot on different
###   featurelist will be halted - modelling jobs in queue would not be
###   affected but new jobs would not be added to queue by halted
###   autopilot.
### Aliases: StartNewAutoPilot

### ** Examples

## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   featureList <- CreateFeaturelist(projectId, "myFeaturelist", c("feature1", "feature2"))
##D   featurelistId <- featureList$featurelistId
##D   StartNewAutoPilot(projectId, featurelistId)
## End(Not run)



