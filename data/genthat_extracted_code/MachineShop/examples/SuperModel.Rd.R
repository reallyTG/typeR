library(MachineShop)


### Name: SuperModel
### Title: Super Learner Model
### Aliases: SuperModel

### ** Examples

library(MASS)

model <- SuperModel(GBMModel, SVMRadialModel, GLMNetModel(lambda = 0.01))
modelfit <- fit(medv ~ ., data = Boston, model = model)
predict(modelfit, newdata = Boston)




