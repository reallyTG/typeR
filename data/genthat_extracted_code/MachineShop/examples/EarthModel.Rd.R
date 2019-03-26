library(MachineShop)


### Name: EarthModel
### Title: Multivariate Adaptive Regression Splines Model
### Aliases: EarthModel

### ** Examples

modelfit <- fit(Species ~ ., data = iris, model = EarthModel())
varimp(modelfit, metric = "nsubsets", scale = FALSE)




