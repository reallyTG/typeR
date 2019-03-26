library(ModelMetrics)


### Name: tnr
### Title: Specificity, True negative rate
### Aliases: tnr specificity

### ** Examples

data(testDF)
glmModel <- glm(y ~ ., data = testDF, family="binomial")
Preds <- predict(glmModel, type = 'response')

tnr(testDF$y, Preds, cutoff = 0)
specificity(testDF$y, Preds, cutoff = 0)




