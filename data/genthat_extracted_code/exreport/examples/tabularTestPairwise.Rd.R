library(exreport)


### Name: tabularTestPairwise
### Title: Display pairwise information about a multiple test between the
###   methods
### Aliases: tabularTestPairwise

### ** Examples

# First we create an experiment from the wekaExperiment problem and prepare
# it to apply the test:
experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
experiment <- expReduce(experiment, "fold", mean)
experiment <- expInstantiate(experiment, removeUnary=TRUE)

# Then we perform a a testMultiplePairwise test procedure
test <- testMultiplePairwise(experiment, "accuracy", "max")

# Different tables can be obtained by using a range of metrics
tabularTestPairwise(test, "pvalue")

tabularTestPairwise(test, "wtl")



