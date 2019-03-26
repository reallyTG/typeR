library(ModelMetrics)


### Name: gini
### Title: GINI Coefficient
### Aliases: gini gini.default gini.glm gini.randomForest gini.glmerMod
###   gini.gbm gini.rpart

### ** Examples

data(testDF)
glmModel <- glm(y ~ ., data = testDF, family="binomial")
Preds <- predict(glmModel, type = 'response')

gini(testDF$y, Preds)
# using s3 method for glm
gini(glmModel)




