library(OneR)


### Name: eval_model
### Title: Classification Evaluation function
### Aliases: eval_model
### Keywords: accuracy evaluation

### ** Examples

data <- iris
model <- OneR(data)
summary(model)
prediction <- predict(model, data)
eval_model(prediction, data)



