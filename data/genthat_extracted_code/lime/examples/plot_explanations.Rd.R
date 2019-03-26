library(lime)


### Name: plot_explanations
### Title: Plot a condensed overview of all explanations
### Aliases: plot_explanations

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
plot_explanations(explanations)



