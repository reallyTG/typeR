library(klaR)


### Name: predict.meclight
### Title: Prediction of Minimal Error Classification
### Aliases: predict.meclight
### Keywords: classif

### ** Examples

data(iris)
meclight.obj <- meclight(Species ~ ., data = iris)
predict(meclight.obj, iris)



