library(exreport)


### Name: testPaired
### Title: Paired Wilcoxon statistical test
### Aliases: testPaired

### ** Examples

# First we create an experiment from the wekaExperiment problem and prepare
# it to apply the test, we must subset it to only two methods:
experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
experiment <- expSubset(experiment, list(method = c("J48", "NaiveBayes")))
experiment <- expSubset(experiment, list(featureSelection = c("no")))
experiment <- expReduce(experiment, "fold", mean)
experiment <- expInstantiate(experiment, removeUnary=TRUE)

# Then we perform a Wilcoxon test procedure
test <- testPaired(experiment, "accuracy", "max")

summary(test)



