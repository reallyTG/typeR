library(mobForest)


### Name: residual.plot
### Title: Produces two plots: a) histogram of residuals, b) predicted Vs
###   residuals. This feature is applicable only when linear regression is
###   considered as the node model.
### Aliases: residual.plot

### ** Examples

## Not run: 
##D library(mlbench)
##D set.seed(1111)
##D # Random Forest analysis of model based recursive partitioning load data
##D data("BostonHousing", package = "mlbench")
##D BostonHousing <- BostonHousing[1:90, c("rad", "tax", "crim", "medv", "lstat")]
##D 
##D # Recursive partitioning based on linear regression model medv ~ lstat with 3
##D # trees.  1 core/processor used. 
##D rfout <- mobforest.analysis(as.formula(medv ~ lstat), c("rad", "tax", "crim"),
##D     mobforest_controls = mobforest.control(ntree = 3, mtry = 2, replace = T,
##D         alpha = 0.05, bonferroni = T, minsplit = 25), data = BostonHousing,
##D     processors = 1, model = linearModel, seed = 1111)
##D # get predictive performance estimates and produce a performance plot
##D residualPlot(rfout)
## End(Not run)




