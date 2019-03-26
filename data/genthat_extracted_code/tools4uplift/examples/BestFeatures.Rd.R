library(tools4uplift)


### Name: BestFeatures
### Title: Feature selection for the interaction estimator
### Aliases: BestFeatures
### Keywords: LASSO logistic

### ** Examples


library(tools4uplift)
data("SimUplift")

features <- BestFeatures(data = SimUplift, treat = "treat", outcome = "y", 
                         predictors = colnames(SimUplift[,3:7]))
features




