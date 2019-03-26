library(rfPermute)


### Name: confusionMatrix
### Title: Confusion Matrix
### Aliases: confusionMatrix

### ** Examples

data(mtcars)

rf <- randomForest(factor(am) ~ ., mtcars, importance = TRUE)
confusionMatrix(rf)




