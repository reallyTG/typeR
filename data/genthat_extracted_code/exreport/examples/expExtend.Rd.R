library(exreport)


### Name: expExtend
### Title: Extend an experiment by adding new parameters
### Aliases: expExtend

### ** Examples

# We load the wekaExperiment problem as an experiment and then add a new param
# with a default value.

experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
expExtend(experiment, list(discretization = "no"))



