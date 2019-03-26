library(lime)


### Name: explain
### Title: Explain model predictions
### Aliases: explain explain.character explain.data.frame explain.imagefile

### ** Examples

# Explaining a model and an explainer for it
library(MASS)
iris_test <- iris[1, 1:4]
iris_train <- iris[-1, 1:4]
iris_lab <- iris[[5]][-1]
model <- lda(iris_train, iris_lab)
explanation <- lime(iris_train, model)

# This can now be used together with the explain method
explain(iris_test, explanation, n_labels = 1, n_features = 2)




