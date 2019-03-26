library(MachineShop)


### Name: BARTMachineModel
### Title: Bayesian Addivitive Regression Trees Model
### Aliases: BARTMachineModel

### ** Examples

## No test: 
library(MASS)

modelfit <- fit(medv ~ ., data = Boston, model = BARTMachineModel())
varimp(modelfit, metric = "splits", num_replicates = 20, scale = FALSE)
## End(No test)




