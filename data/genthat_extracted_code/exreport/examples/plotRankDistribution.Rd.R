library(exreport)


### Name: plotRankDistribution
### Title: Boxplot for the ranks distribution and control hypotheses from
###   multiple test
### Aliases: plotRankDistribution

### ** Examples

# First we create an experiment from the wekaExperiment problem and prepare
# it to apply the test:
experiment <- expCreate(wekaExperiment, name="test", parameter="fold")
experiment <- expReduce(experiment, "fold", mean)
experiment <- expSubset(experiment, list(featureSelection = "yes"))
experiment <- expInstantiate(experiment, removeUnary=TRUE)

# Then we perform a Friedman test included ina a testMultipleControl
# test procedure
test <- testMultipleControl(experiment, "accuracy")

# Finally we obtain the plot
plotRankDistribution(test)
cat()



