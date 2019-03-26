library(mlr)


### Name: makeClassifTask
### Title: Create a classification, regression, survival, cluster,
###   cost-sensitive classification or multilabel task.
### Aliases: makeClassifTask makeClusterTask makeCostSensTask
###   makeMultilabelTask makeRegrTask makeSurvTask Task ClassifTask
###   RegrTask SurvTask CostSensTask ClusterTask MultilabelTask

### ** Examples

if (requireNamespace("mlbench")) {
  library(mlbench)
  data(BostonHousing)
  data(Ionosphere)

  makeClassifTask(data = iris, target = "Species")
  makeRegrTask(data = BostonHousing, target = "medv")
  # an example of a classification task with more than those standard arguments:
  blocking = factor(c(rep(1, 51), rep(2, 300)))
  makeClassifTask(id = "myIonosphere", data = Ionosphere, target = "Class",
    positive = "good", blocking = blocking)
  makeClusterTask(data = iris[, -5L])
}



