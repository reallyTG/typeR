library(costsensitive)


### Name: predict.costprop
### Title: Predict method for Cost-Proportionate Classifier
### Aliases: predict.costprop

### ** Examples

## Not run: 
##D library(costsensitive)
##D data(iris)
##D set.seed(1)
##D X <- X <- iris[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]
##D y <- factor(iris$Species == "setosa", labels = c("class1", "class2"))
##D weights <- rgamma(100, 1)
##D classifier <- caret::train
##D model <- cost.proportionate.classifier(X, y, weights, classifier,
##D   method = "glm", family = "binomial",
##D   trControl=caret::trainControl(method="none"), tuneLength=1)
##D predict(model, X, aggregation = "raw", type = "raw")
##D predict(model, X, aggregation = "weighted", type = "prob")
## End(Not run)



