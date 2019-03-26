library(lulcc)


### Name: lulcc-package
### Title: lulcc: land use change modelling in R
### Aliases: lulcc-package

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
##D                           pattern="lu", 
##D                           categories=c(1,2,3), 
##D                           labels=c("Forest","Built","Other"), 
##D                           t=c(0,6,14))
##D obs
##D 
##D plot(obs)
##D 
##D crossTabulate(obs, times=c(0,14))
##D 
##D ## explanatory variables
##D ef <- ExpVarRasterList(x=pie, pattern="ef")
##D ef
##D 
##D part <- partition(x=obs[[1]], size=0.1, spatial=TRUE)
##D train.data <- getPredictiveModelInputData(obs=obs, ef=ef, cells=part[["train"]])
##D 
##D forms <- list(Built ~ ef_001+ef_002+ef_003,
##D               Forest ~ ef_001+ef_002,
##D               Other ~ ef_001+ef_002)
##D 
##D glm.models <- glmModels(formula=forms, family=binomial, data=train.data, obs=obs)
##D rpart.models <- rpartModels(formula=forms, data=train.data, obs=obs)
##D rf.models <- randomForestModels(formula=forms, data=train.data, obs=obs)
##D 
##D ## test ability of models to predict allocation of forest, built and other
##D ## land uses in testing partition
##D test.data <- getPredictiveModelInputData(obs=obs, ef=ef, cells=part[["test"]])
##D 
##D glm.pred <- PredictionList(models=glm.models, newdata=test.data)
##D glm.perf <- PerformanceList(pred=glm.pred, measure="rch")
##D 
##D rpart.pred <- PredictionList(models=rpart.models, newdata=test.data)
##D rpart.perf <- PerformanceList(pred=rpart.pred, measure="rch")
##D 
##D rf.pred <- PredictionList(models=rf.models, newdata=test.data)
##D rf.perf <- PerformanceList(pred=rf.pred, measure="rch")
##D 
##D plot(list(glm=glm.perf, rpart=rpart.perf, rf=rf.perf))
##D 
##D ## test ability of models to predict location of urban gain 1985 to 1991
##D part <- rasterToPoints(obs[[1]], fun=function(x) x != 2, spatial=TRUE)
##D test.data <- getPredictiveModelInputData(obs=obs, ef=ef, cells=part, t=6)
##D 
##D glm.pred <- PredictionList(models=glm.models[[2]], newdata=test.data)
##D glm.perf <- PerformanceList(pred=glm.pred, measure="rch")
##D 
##D plot(list(glm=glm.perf))
##D 
##D ## obtain demand scenario
##D dmd <- approxExtrapDemand(obs=obs, tout=0:14)
##D matplot(dmd, type="l", ylab="Demand (no. of cells)", xlab="Time point",
##D         lty=1, col=c("Green","Red","Blue"))
##D legend("topleft", legend=obs@labels, col=c("Green","Red","Blue"), lty=1)
##D 
##D ## get neighbourhood values
##D w <- matrix(data=1, nrow=3, ncol=3)
##D nb <- NeighbRasterStack(x=obs[[1]], weights=w, categories=2)
##D 
##D ## create CLUE-S model object
##D clues.rules <- matrix(data=1, nrow=3, ncol=3, byrow=TRUE) 
##D 
##D clues.parms <- list(jitter.f=0.0002,
##D                     scale.f=0.000001,
##D                     max.iter=1000,
##D                     max.diff=50, 
##D                     ave.diff=50) 
##D 
##D clues.model <- CluesModel(obs=obs,
##D                           ef=ef,
##D                           models=glm.models,
##D                           time=0:14,
##D                           demand=dmd,
##D                           elas=c(0.2,0.2,0.2),
##D                           rules=clues.rules,
##D                           params=clues.parms)
##D 
##D ## Create Ordered model
##D ordered.model <- OrderedModel(obs=obs,
##D                               ef=ef,
##D                               models=glm.models,
##D                               time=0:14,
##D                               demand=dmd,
##D                               order=c(2,1,3)) 
##D 
##D ## perform allocation
##D clues.model <- allocate(clues.model)
##D ordered.model <- allocate(ordered.model, stochastic=TRUE)
##D 
##D ## pattern validation
##D 
##D ## CLUE-S
##D clues.tabs <- ThreeMapComparison(x=clues.model,
##D                                  factors=2^(1:8),
##D                                  timestep=14)
##D plot(clues.tabs)
##D plot(clues.tabs, category=1, factors=2^(1:8)[c(1,3,5,7)])
##D 
##D ## Ordered
##D ordered.tabs <- ThreeMapComparison(x=ordered.model,
##D                                  factors=2^(1:8),
##D                                  timestep=14)
##D plot(ordered.tabs)
##D plot(ordered.tabs, category=1, factors=2^(1:8)[c(1,3,5,7)])
##D 
##D ## calculate agreement budget and plot
##D 
##D ## CLUE-S
##D clues.agr <- AgreementBudget(x=clues.tabs)
##D plot(clues.agr, from=1, to=2)
##D 
##D ## Ordered
##D ordered.agr <- AgreementBudget(x=ordered.tabs)
##D plot(ordered.agr, from=1, to=2)
##D 
##D ## calculate Figure of Merit and plot
##D 
##D ## CLUE-S
##D clues.fom <- FigureOfMerit(x=clues.tabs)
##D p1 <- plot(clues.fom, from=1, to=2)
##D 
##D ## Ordered
##D ordered.fom <- FigureOfMerit(x=ordered.tabs)
##D p2 <- plot(ordered.fom, from=1, to=2)
##D 
## End(Not run)




