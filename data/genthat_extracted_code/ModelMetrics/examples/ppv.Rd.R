library(ModelMetrics)


### Name: ppv
### Title: Postive Predictive Value
### Aliases: ppv precision

### ** Examples

data(testDF)
glmModel <- glm(y ~ ., data = testDF, family="binomial")
Preds <- predict(glmModel, type = 'response')

ppv(testDF$y, Preds, cutoff = 0)
precision(testDF$y, Preds, cutoff = 0)




