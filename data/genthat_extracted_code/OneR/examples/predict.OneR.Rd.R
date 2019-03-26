library(OneR)


### Name: predict.OneR
### Title: Predict method for OneR models
### Aliases: predict.OneR

### ** Examples

model <- OneR(iris)
prediction <- predict(model, iris[1:4])
eval_model(prediction, iris[5])

## type prob
predict(model, data.frame(Petal.Width = seq(0, 3, 0.5)))
predict(model, data.frame(Petal.Width = seq(0, 3, 0.5)), type = "prob")



