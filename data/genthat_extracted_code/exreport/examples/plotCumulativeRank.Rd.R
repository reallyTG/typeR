library(exreport)


### Name: plotCumulativeRank
### Title: Area plot for the rank distribution from a multiple test
### Aliases: plotCumulativeRank

### ** Examples

# First we create an experiment from the wekaExperiment problem and prepare
# it to apply the test:
experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
experiment <- expReduce(experiment, "fold", mean)
experiment <- expSubset(experiment, list(featureSelection = "no"))
experiment <- expInstantiate(experiment, removeUnary=TRUE)

# Then we perform a Friedman test included ina a testMultipleControl
# test procedure
test <- testMultipleControl(experiment, "accuracy")

# Finally we obtain the plot
plotCumulativeRank(test)
cat()



