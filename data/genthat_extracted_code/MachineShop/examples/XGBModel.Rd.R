library(MachineShop)


### Name: XGBModel
### Title: Extreme Gradient Boosting Models
### Aliases: XGBModel XGBDARTModel XGBLinearModel XGBTreeModel

### ** Examples

modelfit <- fit(Species ~ ., data = iris, model = XGBTreeModel())
varimp(modelfit, metric = "Frequency", scale = FALSE)




