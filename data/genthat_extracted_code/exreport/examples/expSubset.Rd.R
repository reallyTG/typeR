library(exreport)


### Name: expSubset
### Title: Obtains a subset of an experiment matching the given conditions
### Aliases: expSubset

### ** Examples

# We create a new experiment from the wekaExperiment problem
e <- expCreate(wekaExperiment, parameters="fold", name="Test Experiment")

# We can filter the experiment to reduce the number of methods.
e <- expSubset(e, list(method = c("J48", "NaiveBayes")))
e

# We can filter the experiment to remove a given problem
e <- expSubset(e, list(problem = "iris"), invertSelection=TRUE)
e

# We can subset the experiment to obtain a specific parameter configuration
e <- expSubset(e, list("featureSelection" = "no"))
e



