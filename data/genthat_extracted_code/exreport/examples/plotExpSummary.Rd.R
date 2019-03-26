library(exreport)


### Name: plotExpSummary
### Title: Barplot for summarizing an experiment output variable
### Aliases: plotExpSummary

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

# Now we can generate several plots:

# Default plot:
plotExpSummary(experiment, "accuracy")

# We can include faceting in the plot by dividing it into columns:
plotExpSummary(experiment, "accuracy", columns=3)

# If we want to show the independent interaction for the output variable
# in each experiment we can make the scales for example, remark the difference
# in :
plotExpSummary(experiment, "trainingTime", columns=3, freeScale=FALSE)
plotExpSummary(experiment, "trainingTime", columns=3, freeScale=TRUE)



