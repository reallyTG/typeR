library(exreport)


### Name: testMultiplePairwise
### Title: Multiple Comparison Statistical Test (Friedman + Pairwise
###   Shaffer PostHoc)
### Aliases: testMultiplePairwise

### ** Examples

# First we create an experiment from the wekaExperiment problem and prepare
# it to apply the test:
experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
experiment <- expReduce(experiment, "fold", mean)
experiment <- expSubset(experiment, list(featureSelection = "yes"))
experiment <- expInstantiate(experiment, removeUnary=TRUE)

# Then we perform a testMultiplePairwise test procedure
test <- testMultiplePairwise(experiment, "accuracy", "max")

summary(test)



