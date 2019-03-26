library(exreport)


### Name: testMultipleControl
### Title: Multiple Comparison Statistical Test (Friedman + Control Holm
###   PostHoc)
### Aliases: testMultipleControl

### ** Examples

# First we create an experiment from the wekaExperiment problem and prepare
# it to apply the test:
experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
experiment <- expReduce(experiment, "fold", mean)
experiment <- expSubset(experiment, list(featureSelection = "yes"))
experiment <- expInstantiate(experiment, removeUnary=TRUE)

# Then we perform a testMultiplePairwise test procedure
test <- testMultipleControl(experiment, "accuracy", "max")

summary(test)



