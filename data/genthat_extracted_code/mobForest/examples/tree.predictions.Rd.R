library(mobForest)


### Name: tree.predictions
### Title: Predictions from tree model
### Aliases: tree.predictions

### ** Examples

library(mlbench)
set.seed(1111)
# Random Forest analysis of model based recursive partitioning load data
data("BostonHousing", package = "mlbench")
data <- BostonHousing[1:90, c("rad", "tax", "crim", "medv", "lstat")]
fmBH <- mob.rf.tree(main_model = "medv ~ lstat", 
                     partition_vars = c("rad", "tax", "crim"), mtry = 2,
                     control = mob_control(), data = data, 
                     model = linearModel)
tree.predictions(j = 1, df = data, tree = fmBH@tree)




