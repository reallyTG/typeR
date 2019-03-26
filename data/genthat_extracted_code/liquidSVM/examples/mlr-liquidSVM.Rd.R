library(liquidSVM)


### Name: mlr-liquidSVM
### Title: liquidSVM functions for mlr
### Aliases: mlr-liquidSVM makeRLearner.regr.liquidSVM
###   trainLearner.regr.liquidSVM predictLearner.regr.liquidSVM
###   makeRLearner.classif.liquidSVM trainLearner.classif.liquidSVM
###   predictLearner.classif.liquidSVM

### ** Examples

## Not run: 
##D if(require(mlr)){
##D library(liquidSVM)
##D 
##D ## Define a regression task
##D task <- makeRegrTask(id = "trees", data = trees, target = "Volume")
##D ## Define the learner
##D lrn <- makeLearner("regr.liquidSVM", display=1)
##D ## Train the model use mlr::train to get the correct train function
##D model <- train(lrn,task)
##D pred <- predict(model, task=task)
##D performance(pred)
##D 
##D ## Define a classification task
##D task <- makeClassifTask(id = "iris", data = iris, target = "Species")
##D 
##D ## Define the learner
##D lrn <- makeLearner("classif.liquidSVM", display=1)
##D model <- train(lrn,task)
##D pred <- predict(model, task=task)
##D performance(pred)
##D 
##D ## or for probabilities
##D lrn <- makeLearner("classif.liquidSVM", display=1, predict.type='prob')
##D model <- train(lrn,task)
##D pred <- predict(model, task=task)
##D performance(pred)
##D 
##D } # end if(require(mlr))
## End(Not run)



