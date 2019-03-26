library(ModelMetrics)


### Name: npv
### Title: Negative Predictive Value
### Aliases: npv

### ** Examples

data(testDF)
glmModel <- glm(y ~ ., data = testDF, family="binomial")
Preds <- predict(glmModel, type = 'response')

npv(testDF$y, Preds, cutoff = 0)




