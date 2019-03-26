library(datarobot)


### Name: GetFeatureImpactForModel
### Title: Retrieve completed Feature Impact results given a model
### Aliases: GetFeatureImpactForModel

### ** Examples

## Not run: 
##D   model <- ListModels(project)[[1]]
##D   featureImpactJobId <- RequestFeatureImpact(model)
##D   # Note: This will only work after the feature impact job has completed. Use
##D   #       GetFeatureImpactFromIobId to automatically wait for the job.\
##D   featureImpact <- GetFeatureImpactForModel(model)
## End(Not run)



