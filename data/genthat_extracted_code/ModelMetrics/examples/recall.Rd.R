library(ModelMetrics)


### Name: recall
### Title: Recall, Sensitivity, tpr
### Aliases: recall sensitivity tpr

### ** Examples

data(testDF)
glmModel <- glm(y ~ ., data = testDF, family="binomial")
Preds <- predict(glmModel, type = 'response')

recall(testDF$y, Preds, cutoff = 0)
sensitivity(testDF$y, Preds, cutoff = 0)
tpr(testDF$y, Preds, cutoff = 0)




