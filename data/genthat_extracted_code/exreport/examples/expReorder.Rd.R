library(exreport)


### Name: expReorder
### Title: Change the order of elements that an experiment contains
### Aliases: expReorder

### ** Examples

# We load the wekaExperiment problem as an experiment and then change the order
# of the values for the parameter featureSelection and for one valoue for the method.

experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
expReorder(experiment, list(featureSelection = c("yes","no"),
                           method=c("OneR")))



