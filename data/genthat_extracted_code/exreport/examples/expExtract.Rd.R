library(exreport)


### Name: expExtract
### Title: Extract statistically equivalent methods from a multiple
###   comparison test
### Aliases: expExtract

### ** Examples

# First we create an experiment from the wekaExperiment problem and prepare
# it to apply the test:
experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
experiment <- expReduce(experiment, "fold", mean)
experiment <- expInstantiate(experiment, removeUnary=TRUE)

# Then we perform a testMultiplePairwise test procedure
test <- testMultipleControl(experiment, "trainingTime", "min")

expExtract(test)



