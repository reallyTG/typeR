library(lulcc)


### Name: c.PredictiveModelList
### Title: Merge PredictiveModelList objects
### Aliases: c.PredictiveModelList

### ** Examples


## Not run: 
##D 
##D ## Plum Island Ecosystems
##D 
##D ## load data
##D data(pie)
##D 
##D ## observed maps
##D obs <- ObsLulcRasterStack(x=pie,
##D                    pattern="lu", 
##D                    categories=c(1,2,3), 
##D                    labels=c("Forest","Built","Other"), 
##D                    t=c(0,6,14))
##D 
##D ## explanatory variables
##D ef <- ExpVarRasterList(x=pie, pattern="ef")
##D 
##D part <- partition(x=obs[[1]], size=0.1, spatial=TRUE)
##D train.data <- getPredictiveModelInputData(obs=obs, ef=ef, cells=part[["train"]], t=0)
##D 
##D forms <- list(Built ~ ef_001+ef_002+ef_003,
##D               Forest ~ 1,
##D               Other ~ ef_001+ef_002)
##D 
##D glm.models <- glmModels(formula=forms, family=binomial, data=train.data, obs=obs)
##D glm.models
##D 
##D ## separate glm.models into two PredictiveModelList objects
##D mod1 <- glm.models[[1]]
##D mod2 <- glm.models[[2:3]]
##D 
##D ## put them back together again
##D glm.models <- c(mod1, mod2)
##D glm.models
##D 
## End(Not run)



