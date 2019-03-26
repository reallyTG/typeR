library(ModelMetrics)


### Name: logLoss
### Title: Log Loss
### Aliases: logLoss logLoss.default logLoss.glm logLoss.randomForest
###   logLoss.glmerMod logLoss.gbm logLoss.rpart

### ** Examples

data(testDF)
glmModel <- glm(y ~ ., data = testDF, family="binomial")
Preds <- predict(glmModel, type = 'response')

logLoss(testDF$y, Preds)
# using s3 method for glm
logLoss(glmModel)




