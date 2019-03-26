library(ModelMetrics)


### Name: mse
### Title: Mean Square Error
### Aliases: mse mse.default mse.lm mse.glm

### ** Examples

data(testDF)
glmModel <- glm(y ~ ., data = testDF, family="binomial")
Preds <- predict(glmModel, type = 'response')

mse(testDF$y, Preds)




