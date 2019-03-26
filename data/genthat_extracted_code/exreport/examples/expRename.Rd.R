library(exreport)


### Name: expRename
### Title: Change the name of elements that an experiment contains
### Aliases: expRename

### ** Examples

# We load the wekaExperiment problem as an experiment and then change the name
# of one value for the parameter discretization and for one method.

experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
expRename(experiment, list(featureSelection = c("no"="false"),
                           method=c("RandomForest"="RndForest")))



