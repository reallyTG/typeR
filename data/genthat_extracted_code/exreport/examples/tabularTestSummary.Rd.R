library(exreport)


### Name: tabularTestSummary
### Title: Summarize the result of a multiple comparison statistical test
###   in a table
### Aliases: tabularTestSummary

### ** Examples

# First we create an experiment from the wekaExperiment problem and prepare
# it to apply the test:
experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
experiment <- expReduce(experiment, "fold", mean)
experiment <- expInstantiate(experiment, removeUnary=TRUE)

# Then we perform a a testMultiplePairwise test procedure
test <- testMultipleControl(experiment, "accuracy", "min")

# Different tables can be obtained by using a range of metrics
tabularTestSummary(test, c("pvalue"))

tabularTestSummary(test, c("rank", "pvalue", "wtl"))



