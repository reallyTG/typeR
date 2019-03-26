library(exreport)


### Name: tabularExpSummary
### Title: Summarize the experiment with a table for given outputs
### Aliases: tabularExpSummary

### ** Examples

# This example plots the distribution of the trainingTime variable in the
# wekaExperiment problem.

# First we create the experiment from the problem.
experiment <- expCreate(wekaExperiment, name="test", parameter="fold")

# Next we must process it to have an unique parameter configuration:
# We select a value for the parameter featureSelection:
experiment <- expSubset(experiment, list(featureSelection = "yes"))
# Then we reduce the fold parameter:
experiment <- expReduce(experiment, "fold", mean)
# Finally we remove unary parameters by instantiation:
experiment <- expInstantiate(experiment, removeUnary=TRUE)

# Generate the default table:
tabularExpSummary(experiment, "accuracy")



