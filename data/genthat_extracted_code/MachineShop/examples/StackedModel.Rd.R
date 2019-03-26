library(MachineShop)


### Name: StackedModel
### Title: Stacked Regression Model
### Aliases: StackedModel

### ** Examples

library(MASS)

model <- StackedModel(GBMModel, SVMRadialModel, GLMNetModel(lambda = 0.01))
modelfit <- fit(medv ~ ., data = Boston, model = model)
predict(modelfit, newdata = Boston)




