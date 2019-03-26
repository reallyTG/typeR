library(lulcc)


### Name: predict.PredictiveModelList
### Title: Predict location suitability
### Aliases: predict.PredictiveModelList predict,PredictiveModelList-method

### ** Examples


## Not run: 
##D 
##D ## Sibuyan Island
##D 
##D ## load observed land use data
##D obs <- ObsLulcRasterStack(x=sibuyan$maps,
##D                     pattern="lu",
##D                     categories=c(1,2,3,4,5),
##D                     labels=c("Forest","Coconut","Grass","Rice","Other"),
##D                     t=c(0,14))
##D 
##D ## load explanatory variables
##D ef <- ExpVarRasterList(x=sibuyan$maps, pattern="ef")
##D 
##D ## separate data into training and testing partitions
##D part <- partition(x=obs[[1]], size=0.1, spatial=TRUE)
##D train.data <- getPredictiveModelInputData(obs=obs, ef=ef, cells=part[["train"]])
##D all.data <- getPredictiveModelInputData(obs=obs, ef=ef, cells=part[["all"]])
##D 
##D ## get glm.models from data
##D forms <- list(Forest ~ ef_001+ef_002+ef_003+ef_004+ef_005+ef_006+ef_007+ef_008+ef_010+ef_012,
##D               Coconut ~ ef_001+ef_002+ef_005+ef_007+ef_008+ef_009+ef_010+ef_011+ef_012,
##D               Grass~ef_001+ef_002+ef_004+ef_005+ef_007+ef_008+ef_009+ef_010+ef_011+ef_012+ef_013,
##D               Rice~ef_009+ef_010+ef_011,
##D               Other~1)
##D 
##D glm.models <- glmModels(formula=forms, family=binomial, data=train.data, obs=obs)
##D 
##D ## create suitability maps
##D suitability.maps <- predict(object=glm.models, newdata=all.data, data.frame=TRUE)
##D points <- rasterToPoints(obs[[1]], spatial=TRUE)
##D suitability.maps <- SpatialPointsDataFrame(coords=points, data=suitability.maps)
##D r <- stack(rasterize(x=suitability.maps, y=obs[[1]], field=names(suitability.maps)))
##D plot(r)
##D 
##D ## library(rasterVis)
##D ## levelplot(r)
##D 
## End(Not run)



