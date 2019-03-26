library(rpart.plot)


### Name: rpart.predict
### Title: Extended version of predict.rpart
### Aliases: rpart.predict

### ** Examples

data(ptitanic)
model <- rpart(survived ~ ., data = ptitanic, cp = .02)
head(rpart.predict(model, rules=TRUE))



