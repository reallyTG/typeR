library(ModelMetrics)


### Name: rmse
### Title: Root-Mean Square Error
### Aliases: rmse rmse.default rmse.lm rmse.glm

### ** Examples

data(testDF)
glmModel <- glm(y ~ ., data = testDF, family="binomial")
Preds <- predict(glmModel, type = 'response')

rmse(testDF$y, Preds)




