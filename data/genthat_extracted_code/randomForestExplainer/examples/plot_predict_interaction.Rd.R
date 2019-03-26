library(randomForestExplainer)


### Name: plot_predict_interaction
### Title: Plot the prediction of the forest for a grid of values of two
###   numerical variables
### Aliases: plot_predict_interaction

### ** Examples

forest <- randomForest::randomForest(Species ~., data = iris)
plot_predict_interaction(forest, iris, "Petal.Width", "Sepal.Width")




