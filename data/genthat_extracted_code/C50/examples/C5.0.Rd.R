library(C50)


### Name: C5.0.default
### Title: C5.0 Decision Trees and Rule-Based Models
### Aliases: C5.0.default C5.0.formula C5.0 C5.0.formula
### Keywords: models

### ** Examples


data(churn)

treeModel <- C5.0(x = churnTrain[, -20], y = churnTrain$churn)
treeModel
summary(treeModel)

ruleModel <- C5.0(churn ~ ., data = churnTrain, rules = TRUE)
ruleModel
summary(ruleModel)




