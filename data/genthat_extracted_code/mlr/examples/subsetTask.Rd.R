library(mlr)


### Name: subsetTask
### Title: Subset data in task.
### Aliases: subsetTask

### ** Examples

task = makeClassifTask(data = iris, target = "Species")
subsetTask(task, subset = 1:100)



