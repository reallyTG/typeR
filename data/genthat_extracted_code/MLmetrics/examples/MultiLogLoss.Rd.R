library(MLmetrics)


### Name: MultiLogLoss
### Title: Multi Class Log Loss
### Aliases: MultiLogLoss

### ** Examples

data(iris)
svm.model <- e1071::svm(Species~., data = iris, probability = TRUE)
pred <- predict(svm.model, iris, probability = TRUE)
MultiLogLoss(y_true = iris$Species, y_pred = attr(pred, "probabilities"))



