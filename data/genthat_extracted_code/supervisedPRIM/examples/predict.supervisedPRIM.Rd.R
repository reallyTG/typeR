library(supervisedPRIM)


### Name: predict.supervisedPRIM
### Title: Model Predictions
### Aliases: predict.supervisedPRIM

### ** Examples

# Train a model to determine if a flower is setosa
data(iris)
yData <- factor(ifelse(iris$Species == "setosa", "setosa", "other"), levels = c("setosa", "other"))
xData <- iris
xData$Species <- NULL
primModel <- supervisedPRIM(x = xData, y = yData)
# Predict on the original dataset
predictions <- predict(primModel, newdata = xData)



