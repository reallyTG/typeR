library(tuneRanger)


### Name: restartTuneRanger
### Title: restartTuneRanger
### Aliases: restartTuneRanger

### ** Examples

## Not run: 
##D library(tuneRanger)
##D library(mlr)
##D 
##D # iris is a bit nonsense here
##D # A mlr task has to be created in order to use the package
##D # the already existing iris task is used here
##D estimateTimeTuneRanger(iris.task)
##D # temporarily file name to save results
##D path = tempfile()
##D res = tuneRanger(iris.task, measure = list(multiclass.brier), num.trees = 1000, 
##D   num.threads = 8, iters = 70, save.file.path = path)
##D 
##D # Mean of best 5 % of the results
##D res
##D 
##D # Restart after failing in one of the iterations:
##D res = restartTuneRanger(save.file.path = path, iris.task, 
##D measure = list(multiclass.brier))
## End(Not run)



