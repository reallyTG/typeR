library(mlr)


### Name: listLearners
### Title: Find matching learning algorithms.
### Aliases: listLearners listLearners.default listLearners.character
###   listLearners.Task

### ** Examples

## Not run: 
##D listLearners("classif", properties = c("multiclass", "prob"))
##D data = iris
##D task = makeClassifTask(data = data, target = "Species")
##D listLearners(task)
## End(Not run)



