library(exreport)


### Name: expReduce
### Title: Reduce a parameter by a function for each method, problem and
###   remaining parameter configuration interaction
### Aliases: expReduce

### ** Examples

# Create an experiment from the wekaExperiment
experiment <- expCreate(wekaExperiment, name="test-exp", parameter="fold")

# We would like to reduce the fold parameter by its mean value. This way
expReduce(experiment, "fold", mean)



