library(OOBCurve)


### Name: OOBCurve
### Title: Out of Bag Learning curve
### Aliases: OOBCurve

### ** Examples


library(mlr)
library(ranger)

# Classification
data = getTaskData(sonar.task)
sonar.task = makeClassifTask(data = data, target = "Class")
lrn = makeLearner("classif.ranger", keep.inbag = TRUE, par.vals = list(num.trees = 100))
mod = train(lrn, sonar.task)

# Alternatively use ranger directly
# mod = ranger(Class ~., data = data, num.trees = 100, keep.inbag = TRUE)
# Alternatively use randomForest
# mod = randomForest(Class ~., data = data, ntree = 100, keep.inbag = TRUE)

# Application of the main function
results = OOBCurve(mod, measures = list(mmce, auc, brier), task = sonar.task, data = data)
# Plot the generated results
plot(results$mmce, type = "l", ylab = "oob-mmce", xlab = "ntrees")
plot(results$auc, type = "l", ylab = "oob-auc", xlab = "ntrees")
plot(results$brier, type = "l", ylab = "oob-brier-score", xlab = "ntrees")

# Regression
data = getTaskData(bh.task)
bh.task = makeRegrTask(data = data, target = "medv")
lrn = makeLearner("regr.ranger", keep.inbag = TRUE, par.vals = list(num.trees = 100))
mod = train(lrn, bh.task)

# Application of the main function
results = OOBCurve(mod, measures = list(mse, mae, rsq), task = bh.task, data = data)
# Plot the generated results
plot(results$mse, type = "l", ylab = "oob-mse", xlab = "ntrees")
plot(results$mae, type = "l", ylab = "oob-mae", xlab = "ntrees")
plot(results$rsq, type = "l", ylab = "oob-mae", xlab = "ntrees")




