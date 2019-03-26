library(mobForest)


### Name: mobforest.analysis
### Title: Model-based random forest analysis
### Aliases: mobforest.analysis

### ** Examples

library(mlbench)
set.seed(1111)
# Random Forest analysis of model based recursive partitioning load data
data("BostonHousing", package = "mlbench")
BostonHousing <- BostonHousing[1:90, c("rad", "tax", "crim", "medv", "lstat")]

# Recursive partitioning based on linear regression model medv ~ lstat with 3
# trees.  1 core/processor used. 
rfout <- mobforest.analysis(as.formula(medv ~ lstat), c("rad", "tax", "crim"),
    mobforest_controls = mobforest.control(ntree = 3, mtry = 2, replace = TRUE,
        alpha = 0.05, bonferroni = TRUE, minsplit = 25), data = BostonHousing,
    processors = 1, model = linearModel, seed = 1111)
## Not run: 
##D rfout  
## End(Not run)




