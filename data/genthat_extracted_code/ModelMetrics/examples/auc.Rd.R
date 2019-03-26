library(ModelMetrics)


### Name: auc
### Title: Area Under the Curve
### Aliases: auc auc.default auc.glm auc.randomForest auc.glmerMod auc.gbm
###   auc.rpart

### ** Examples

data(testDF)
glmModel <- glm(y ~ ., data = testDF, family="binomial")
Preds <- predict(glmModel, type = 'response')

auc(testDF$y, Preds)
# using s3 method for glm
auc(glmModel)





