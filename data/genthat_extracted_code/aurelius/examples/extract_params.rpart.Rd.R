library(aurelius)


### Name: extract_params.rpart
### Title: extract_params.rpart
### Aliases: extract_params.rpart

### ** Examples

model <- rpart::rpart(Kyphosis ~ Age + as.factor(Number), data = rpart::kyphosis)
my_tree <- extract_params(model)



