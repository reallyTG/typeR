library(aurelius)


### Name: build_model.naiveBayes
### Title: build_model.naiveBayes
### Aliases: build_model.naiveBayes

### ** Examples

model <- e1071::naiveBayes(Species ~ ., data=iris) 
model_built <- build_model(model)



