library(aurelius)


### Name: pfa.rpart
### Title: PFA Formatting of Fitted rpart Tree Models
### Aliases: pfa.rpart

### ** Examples

model <- rpart::rpart(Species ~ ., data=iris)
model_as_pfa <- pfa(model)



