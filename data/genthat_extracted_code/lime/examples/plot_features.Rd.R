library(lime)


### Name: plot_features
### Title: Plot the features in an explanation
### Aliases: plot_features

### ** Examples

# Create some explanations
library(MASS)
iris_test <- iris[1, 1:4]
iris_train <- iris[-1, 1:4]
iris_lab <- iris[[5]][-1]
model <- lda(iris_train, iris_lab)
explanation <- lime(iris_train, model)
explanations <- explain(iris_test, explanation, n_labels = 1, n_features = 2)

# Get an overview with the standard plot
plot_features(explanations)




