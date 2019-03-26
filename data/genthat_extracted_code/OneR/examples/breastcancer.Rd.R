library(OneR)


### Name: breastcancer
### Title: Breast Cancer Wisconsin Original Data Set
### Aliases: breastcancer
### Keywords: Wisconsin breast cancer data datasets

### ** Examples

data(breastcancer)
data <- optbin(breastcancer, method = "infogain")
model <- OneR(data, verbose = TRUE)
summary(model)
plot(model)
prediction <- predict(model, data)
eval_model(prediction, data)



