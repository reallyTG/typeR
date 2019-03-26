library(aurelius)


### Name: build_model.rpart
### Title: build_model.rpart
### Aliases: build_model.rpart

### ** Examples

model <- rpart::rpart(Kyphosis ~ Age + as.factor(Number), data = rpart::kyphosis)
my_tree <- build_model(model)



