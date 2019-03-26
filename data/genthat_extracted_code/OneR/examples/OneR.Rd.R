library(OneR)


### Name: OneR
### Title: One Rule function
### Aliases: OneR OneR.formula OneR.data.frame
### Keywords: 1R One OneR Rule

### ** Examples

data <- optbin(iris)
model <- OneR(data, verbose = TRUE)
summary(model)
plot(model)
prediction <- predict(model, data)
eval_model(prediction, data)

## The same with the formula interface:
data <- optbin(iris)
model <- OneR(Species ~., data = data, verbose = TRUE)
summary(model)
plot(model)
prediction <- predict(model, data)
eval_model(prediction, data)



