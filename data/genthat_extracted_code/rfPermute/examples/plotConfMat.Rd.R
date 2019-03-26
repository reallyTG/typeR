library(rfPermute)


### Name: plotConfMat
### Title: Plot Confusion Matrix
### Aliases: plotConfMat

### ** Examples

data(mtcars)

rf <- randomForest(factor(am) ~ ., mtcars)
plotConfMat(rf)




