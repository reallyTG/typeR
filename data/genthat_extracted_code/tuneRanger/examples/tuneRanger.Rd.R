library(tuneRanger)


### Name: tuneRanger
### Title: tuneRanger
### Aliases: tuneRanger

### ** Examples

## Not run: 
##D library(tuneRanger)
##D library(mlr)
##D 
##D # A mlr task has to be created in order to use the package
##D data(iris)
##D iris.task = makeClassifTask(data = iris, target = "Species")
##D  
##D # Estimate runtime
##D estimateTimeTuneRanger(iris.task)
##D # Tuning
##D res = tuneRanger(iris.task, measure = list(multiclass.brier), num.trees = 1000, 
##D   num.threads = 2, iters = 70, save.file.path = NULL)
##D   
##D # Mean of best 5 % of the results
##D res
##D # Model with the new tuned hyperparameters
##D res$model
##D # Prediction
##D predict(res$model, newdata = iris[1:10,])
## End(Not run)



