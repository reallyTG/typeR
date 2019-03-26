library(rpart.plot)


### Name: rpart.rules
### Title: Print an rpart model as a set of rules.
### Aliases: rpart.rules print.rpart.rules

### ** Examples

data(ptitanic)
model <- rpart(survived ~ ., data = ptitanic, cp = .02)
rpart.plot(model)
rpart.rules(model)



