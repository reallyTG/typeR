library(exreport)


### Name: expInstantiate
### Title: Instatiate the methods in the experiment for each one of the
###   different parameter configurations.
### Aliases: expInstantiate

### ** Examples

# Create an experiment from the wekaExperiment
experiment <- expCreate(wekaExperiment, name="test-exp", parameter="fold")

# We would like to reduce the fold parameter by its mean value. It becomes an
# unary parameter.
experiment <- expReduce(experiment, "fold", mean)

# Now we instantiate the experiment by the featureSelection parameter and
# remove the unary fold parameter
expInstantiate(experiment, removeUnary=TRUE)



